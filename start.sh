#!/bin/bash

# Check number of master node
master_count=$(grep -E '^master_count' Vagrantfile|cut -d '=' -f2)

if [ $master_count -lt 1 ]
then

	echo "You have to change the value of master_count in Vagrantfile. 1 master is required at least."
	exit 1
fi

# Create all hosts and run hello.yml
vagrant up

# dump vagrant ssh config to pass it explicitly to ansible
# for execute ansible-playbook manually
# this is necessary to run the playbook in parallel on each host
vagrant ssh-config > ansible/vagrant-ssh-config

# Provision of all hosts in parallel
cd ansible
export ANSIBLE_CONFIG=ansible.cfg
export ANSIBLE_COLLECTIONS_PATHS=.ansible/collections/ansible_collections
ansible-galaxy collection install kubernetes.core
ansible-playbook kube-install.yml

exit 0
