# kube-lab-installer

This project allows you to deploy a kubernetes cluster locally on your laptop. I did it to train for the CKA certification.
For that it uses the following tools :
	- Ansible 
	- Vagrant with virtualbox
	- kubeadm

# Setting

You can change the number of master or worker nodes in the cluster by changing the variables `master_count` `worker_count` in the Vagrantfile. The Ansible inventory is dynamically generated by Vagrant.
You can change some settings like the container runtime or kubernetes version in `ansible/group_vars/all.yml"


## Install

```
$ ./start.sh
```

## TODO :

	- loadbalancer for API Server 
	- wait all node are ready
	- copy kubeconfig on localhost
	- check if kube is already install
	- ansible lint

	- new roles : 
	
		- update to new version of kubernetes
		- restore etcd
		- clean environement
		- kyverno policy
