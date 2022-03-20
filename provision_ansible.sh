#!/bin/bash
echo "Starting provisioning of Ansible..."

if [[ $(hostname) = "controller" ]]; then
  sudo apt-get update -y
  sudo apt-get install ansible -y
fi

# configure the following ips in /etc/hosts file
# 192.168.50.20 controller
# 192.168.50.21 node01
# 192.168.50.22 node02

echo -e "192.168.50.02 controller\n192.168.50.21 node01\n192.168.50.22 node02" >> /etc/hosts

echo "Finishing up Ansible"