# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version
VAGRANTFILE_API_VERSION = '2'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = 'chef/debian-7.6'
  config.vm.box_url = 'https://atlas.hashicorp.com/chef/boxes/debian-7.6'

  config.vm.network "forwarded_port", guest: 8000, host: 8000

  config.vm.provision 'shell',
    path: "bash/provision.sh"
end
