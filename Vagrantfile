# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  os = "ubuntu/focal64"
  net_ip = "192.168.50"

  config.vm.define :ubucontroller, primary: true do |ubucontroller_config|
    ubucontroller_config.vm.provider "virtualbox" do |vb|
        vb.memory = "2048"
        vb.cpus = 2
        vb.name = "ubucontroller"
    end

    ubucontroller_config.vm.box = "#{os}"
    ubucontroller_config.vm.host_name = 'ubucontroller.local'
    ubucontroller_config.vm.network "private_network", ip: "#{net_ip}.10"
    ubucontroller_config.landrush.enabled = true
    ubucontroller_config.vm.provision "shell" do |provision|
      provision.path = "provision_ansible.sh"
    end
    ubucontroller_config.vm.provision :shell, :inline => <<'EOF'

        if [ ! -f "/home/vagrant/.ssh/id_rsa" ]; then
  ssh-keygen -t rsa -N "" -f /home/vagrant/.ssh/id_rsa
fi
cp /home/vagrant/.ssh/id_rsa.pub /vagrant/control.pub

cat << 'SSHEOF' > /home/vagrant/.ssh/config
Host *
  StrictHostKeyChecking no
  UserKnownHostsFile=/dev/null
SSHEOF
chown -R vagrant:vagrant /home/vagrant/.ssh/
EOF
  end

  [
    ["ubunode01",    "#{net_ip}.11",    "1024",    os ],
    ["ubunode02",    "#{net_ip}.12",    "1024",    os ],
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
      node_config.landrush.enabled = true
      node_config.vm.provision :shell, inline: 'cat /vagrant/control.pub >> /home/vagrant/.ssh/authorized_keys'
    end
  end
end
