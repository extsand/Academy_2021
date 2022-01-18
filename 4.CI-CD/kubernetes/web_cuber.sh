#!/bin/bash
# https://labs.play-with-k8s.com/

extsand/academy_docker.page:tagname

#Init cluster master node
kubeadm init --apiserver-advertise-address $(hostname -i) --pod-network-cidr 10.5.0.0/16

#Init cluster networking
kubectl apply -f https://raw.githubusercontent.com/cloudnativelabs/kube-router/master/daemonset/kubeadm-kuberouter.yaml

#Optional
#Create an nginx deployment
kubectl apply -f https://raw.githubusercontent.com/kubernetes/website/master/content/en/examples/application/nginx-app.yaml



#Connect worker to master node
kubeadm join 192.168.0.13:6443 --token idszta.bn3m22de8hx5i7yo --discovery-token-ca-cert-hash sha256:132404c1d7ce663dafe1a5d4ec3a615872fd15dfceb358b673418fa601153419

#looking at nodes
kubectl get nodes

#change name
kubectl label node name_node2 node-role.kubernetes.io/worker=
kubectl label node node2 node-role.kubernetes.io/worker=