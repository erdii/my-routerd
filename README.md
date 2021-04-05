## cluster

- k3s because i'm lazy
- cluster-network-addons-operator stuff taken from
  - https://github.com/kubevirt/cluster-network-addons-operator/releases/download/v0.50.0/{operator,namespace,network-addons-config.crd}.yaml


## interfaces

name|addresses|description
--|--|--
enp6s0|yeah whatever - DHCP|uplink
enp5s0|192.168.34.1/24|trusted management interface
enp1s0|192.168.35.1/24|lan1 - testlab
