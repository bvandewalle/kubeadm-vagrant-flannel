#!/bin/sh

# More Info: https://kubernetes.io/docs/getting-started-guides/kubeadm/#tear-down
sudo kubeadm init --api-advertise-addresses 192.168.100.10 --pod-network-cidr=10.244.0.0/16 --token=cf0abb.2a9454e853fcf4a9
kubectl -n kube-system get ds -l 'component=kube-proxy' -o json | jq '.items[0].spec.template.spec.containers[0].command |= .+ ["--cluster-cidr=10.32.0.0/12"]' | kubectl apply -f - && kubectl -n kube-system delete pods -l 'component=kube-proxy'
kubectl apply -f kube-flannel.yaml
