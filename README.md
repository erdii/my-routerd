## cluster

- cluster-network-addons-operator stuff taken from
  - https://github.com/kubevirt/cluster-network-addons-operator/releases/download/v0.50.0/{operator,namespace,network-addons-config.crd}.yaml


## interfaces

| name   | addresses            | description                  |
| ------ | -------------------- | ---------------------------- |
| enp6s0 | yeah whatever - DHCP | uplink                       |
| enp5s0 | 192.168.34.1/24      | trusted management interface |
| enp1s0 | 192.168.35.1/24      | lan1 - testlab               |


## networks

global id: 3vvu6ncwaa
subnet id: t4ju

| Name       | Net v6                   | Net v4           |
| ---------- | ------------------------ | ---------------- |
| ULA 48     | fd37:dc42:5e0a::/48      |                  |
| wg-stub    | fd37:dc42:5e0a:ffff::/64 | 192.168.255.0/24 |
| management | fd37:dc42:5e0a:0034::/64 | 192.168.34.0/24  |
| lab        | fd37:dc42:5e0a:0035::/64 | 192.168.35.0/24  |
| k8s        | fd37:dc42:5e0a:640e::/63 |                  |
| k8s Pod    | fd37:dc42:5e0a:640e::/64 | 10.244.0.0/16    |
| k8s SVC    | fd37:dc42:5e0a:640f::/64 | 10.96.0.0/12     |
