ROUTERD_IP = "192.168.35.1"
ROUTERD_USER = "root"

apply-base: .kubeconfig
	export KUBECONFIG=$$PWD/.kubeconfig \
		&& kubectl apply -f manifests/cluster-network-addons-operator/ \
		&& kubectl apply -f manifests/cluster-network-addons-operator-config/
.PHONY: apply-base

apply-routerd: .kubeconfig
	export KUBECONFIG=$$PWD/.kubeconfig \
		&& kubectl apply -f manifests/routerd
.PHONY: apply-routerd

sync:
	rsync -rv \
	--perms \
	--delete-after \
		"files/etc/systemd/network/" \
		"$(ROUTERD_USER)@$(ROUTERD_IP):/etc/systemd/network/"

	rsync -rv --delete-after \
		"files/etc/systemd/system/crio.service.d/" \
		"$(ROUTERD_USER)@$(ROUTERD_IP):/etc/systemd/system/crio.service.d/"

	ssh "$(ROUTERD_USER)@$(ROUTERD_IP)" networkctl reload
	ssh "$(ROUTERD_USER)@$(ROUTERD_IP)" systemctl daemon-reload
.PHONY: sync

ssh-tunnel:
	ssh -L 6443:127.0.0.1:6443 "$(ROUTERD_USER)@$(ROUTERD_IP)" ping 1.1.1.1
.PHONY: ssh-tunnel

.kubeconfig:
	rsync -v \
		"$(ROUTERD_USER)@$(ROUTERD_IP):/etc/rancher/k3s/k3s.yaml" \
		.kubeconfig
