ROUTERD_IP = "192.168.185.23"
ROUTERD_USER = "root"

apply: .kubeconfig
	export KUBECONFIG=$$PWD/.kubeconfig \
		&& kubectl apply -f manifests/cluster-network-addons-operator/ \
		&& kubectl apply -f manifests/cluster-network-addons-operator-config/
.PHONY: apply

sync:
	rsync -rv --delete-after \
		"files/etc/systemd/network/" \
		"$(ROUTERD_USER)@$(ROUTERD_IP):/etc/systemd/network/"

	rsync -rv --delete-after \
		"files/etc/systemd/system/k3s.service.d/" \
		"$(ROUTERD_USER)@$(ROUTERD_IP):/etc/systemd/system/k3s.service.d/"
.PHONY: sync

.kubeconfig:
	rsync -v \
		"$(ROUTERD_USER)@$(ROUTERD_IP):/etc/rancher/k3s/k3s.yaml" \
		.kubeconfig
