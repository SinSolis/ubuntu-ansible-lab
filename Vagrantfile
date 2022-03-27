# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  os = "ubuntu/focal64"
  net_ip = "192.168.50"

  config.vm.define :controller, primary: true do |controller_config|
    controller_config.vm.provider "virtualbox" do |vb|
        vb.memory = "2048"
        vb.cpus = 2
        vb.name = "controller"
    end

    controller_config.vm.box = "#{os}"
    controller_config.vm.host_name = 'controller.local'
    controller_config.vm.network "private_network", ip: "#{net_ip}.20"
    controller_config.vm.synced_folder "./ansible", "/home/vagrant/ansible", owner: "vagrant", group: "vagrant",
      mount_options: ["dmode=775,fmode=600"]
    controller_config.vm.provision "shell" do |provision|
      provision.path = "provision_env.sh"
    end
    controller_config.vm.provision "shell" do |provision|
        provision.path = "provision_ansible.sh"
    end
  end
  [
    ["node01",    "#{net_ip}.21",    "1024",    os ],
    ["node02",    "#{net_ip}.22",    "1024",    os ],
  ].each do |vmname,ip,mem,os|
    config.vm.define "#{vmname}" do |node_config|
      node_config.vm.provider "virtualbox" do |vb|
          vb.memory = "#{mem}"
          vb.cpus = 1
          vb.name = "#{vmname}"
      end

      node_config.vm.box = "#{os}"
      node_config.vm.hostname = "#{vmname}"
      node_config.vm.network "private_network", ip: "#{ip}"
      node_config.vm.provision :shell, inline: 'cat /vagrant/control.pub >> /home/vagrant/.ssh/authorized_keys'
      node_config.vm.provision "shell" do |provision|
        provision.path = "provision_ansible.sh"
      end
    end
  end
end
