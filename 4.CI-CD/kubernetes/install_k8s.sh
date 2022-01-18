#!/bin/bash
# Minikube installation asset for VirtualBox w7

# more about:
# step 0 
# set VirtualBox for inretnal Virtualization
# https://www.comss.ru/page.php?id=7726
# cd C:\Program Files\Oracle\VirtualBox
# VBoxManage.exe list vms
# VBoxManage.exe modifyvm "название виртуальной системы" --nested-hw-virt on





# step 1
# install kubectl
# https://kubernetes.io/ru/docs/tasks/tools/install-kubectl/#%D1%83%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0%B0-kubectl-%D0%B2-linux

# step 2
# install minikube
# https://kubernetes.io/ru/docs/tasks/tools/install-minikube/

# step 3
# install KWM
# https://help.ubuntu.com/community/KVM/Installation



echo 'Install kuberctl'
sudo apt-get update
sudo apt-get install -y apt-transport-https
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubectl
echo 'kuberctl installation was done'
kubectl version

echo 'Install minikube'
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 \
  && chmod +x minikube
sudo mkdir -p /usr/local/bin/
sudo install -y minikube /usr/local/bin/
echo 'Minikube installation was done minikube'

echo 'Install KVM'
sudo apt-get install -y qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils
sudo adduser `id -un` libvirt
sudo adduser `id -un` kvm
virsh list --all
echo 'KVM installation was done minikube'


echo 'Test minikube'
minikube start --vm-driver=kvm2 