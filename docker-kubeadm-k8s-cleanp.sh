#!/bin/bash

echo "Removing docker kubeadm kubelet kubectl."
echo
read -p "Do you want to purge kubelet kubectl and docker [y/N]: " deb_remove_option < /dev/tty

if [ $deb_remove_option == "y" ]; then
DEL_LEVEL="purge"
else
DEL_LEVEL="remove"
fi

yes | sudo kubeadm reset

sudo apt-get $DEL_LEVEL --allow-change-held-packages kubelet kubeadm kubectl docker.io docker-ce
