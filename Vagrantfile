# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/jammy64"
  config.vm.provider "virtualbox" do |vb|
    vb.memory = 1024
  end

  # Define LogServer VM
  config.vm.define "LogServer" do |server|
    server.vm.hostname = "LogServer"
    server.vm.network "private_network", ip: "192.168.100.10"
    server.vm.provider "virtualbox" do |vb|
      vb.name = "LogServer"
      vb.memory = 2048
    end

    server.vm.provision "shell", inline: <<-SHELL
      sudo apt update -y
      sudo apt install -y rsyslog net-tools
      sudo mkdir -p /var/log/remote
      sudo chmod 755 /var/log/remote
      sudo chown syslog:adm /var/log/remote

      # Enable UDP listening
      sudo bash -c 'cat >> /etc/rsyslog.conf <<EOF
module(load="imudp")
input(type="imudp" port="514")
EOF'
      echo '*.* /var/log/remote/syslog.log' | sudo tee /etc/rsyslog.d/remote.conf
      sudo systemctl restart rsyslog
    SHELL
  end

  # Define LogClient VM
  config.vm.define "LogClient" do |client|
    client.vm.hostname = "LogClient"
    client.vm.network "private_network", ip: "192.168.100.20"
    client.vm.provider "virtualbox" do |vb|
      vb.name = "LogClient"
      vb.memory = 1024
    end

    client.vm.provision "shell", inline: <<-SHELL
      sudo apt update -y
      sudo apt install -y rsyslog net-tools
      echo '*.* @192.168.100.10:514' | sudo tee /etc/rsyslog.d/forward.conf
      sudo systemctl restart rsyslog

      # Test log after setup
      logger "TERE! See on testlogi kliendilt (Vagrant auto-test)"
    SHELL
  end
end
