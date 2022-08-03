os_distrib="generic/ubuntu2004"
master_count=1
worker_count=1

Vagrant.configure("2") do |config|

  (1..master_count).each do |i|					# Create master
    config.vm.define "master#{i}" do |master|
      master.vm.hostname = "master#{i}"
      master.vm.box = os_distrib
      master.vm.network "private_network", ip: "10.0.0.1#{i}"
      master.vm.provider "virtualbox" do |vb|
        vb.memory = 2048
        vb.cpus = 2
      end
    end
  end

  (1..worker_count).each do |i|					# Create worker
    config.vm.define "worker#{i}" do |worker|
      worker.vm.hostname = "worker#{i}"
      worker.vm.box = os_distrib
      worker.vm.network "private_network", ip: "10.0.0.2#{i}"
      worker.vm.provider "virtualbox" do |vb|
        vb.memory = 2048
        vb.cpus = 2
      end
    end
  end

  config.vm.provision "ansible" do |ansible|			# Generate ansible hosts group
        ansible.playbook = "ansible/hello.yml"
	ansible.config_file = "ansible/ansible.cfg"
        ansible.groups = {
	  "master" => [ "master[1:#{master_count}]" ],
	  "worker" => [ "worker[1:#{worker_count}]" ],
          "cluster:children" => ["master","worker"]
        }
  end

end
