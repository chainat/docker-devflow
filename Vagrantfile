# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.provider "virtualbox" do |v|
    v.memory = 1024
    v.cpus = 1
    v.name = "Docker Host for DevFlow"
  end

  # Base box (Ubuntu:14.04)
  config.vm.box = "ubuntu/trusty64"


  # Network and ports
  config.vm.network "private_network", ip: "192.168.10.10"
  config.vm.network "forwarded_port", guest: 80, host: 8000
  config.vm.network "forwarded_port", guest: 3306, host: 3306

  # Folder permissions for local dev environment, (for staging and prod please specify in Dockerfile when building an image)
  # Synced folders are always executed first, use uid/gid here so that the actual user in text format can be created and mapped in shell
  config.vm.synced_folder ".", "/var/www/devflow", owner: "www-data", group: "www-data"

  config.vm.synced_folder "./docker", "/var/www/devflow/docker", owner: "root", group: "root", mount_options: ["dmode=755,fmode=755"]
  #config.vm.synced_folder "./docker/api/cmd/", "/var/www/devflow/docker/api/cmd/", owner: "www-data", group: "www-data", mount_options: ["dmode=755,fmode=755"]

  # Install Guest Additions in VM
  config.vbguest.auto_update = true
  config.vbguest.no_remote = false

  # Install docker command
  config.vm.provision "docker"

  # Install docker-compose
  config.vm.provision "shell",
      :inline => "echo 'Installing docker-compose' && bash -c 'curl -L https://github.com/docker/compose/releases/download/1.5.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose' > /dev/null 2>&1 && chmod +x /usr/local/bin/docker-compose  && echo 'Done!'",
      :run => "always"

  config.vm.provision "shell",
     :path => "docker/scripts/startup.sh",
     :run => "always"
end
