# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version
VAGRANTFILE_API_VERSION = '2'

HOST_SYNC_DIR="#{Dir.pwd}/share"
GUEST_SYNC_DIR='/share'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = 'chef/debian-7.6'
  config.vm.box_url = 'https://atlas.hashicorp.com/chef/boxes/debian-7.6'

  config.vm.provision 'ansible' do |ansible|
    ansible.sudo = true
    ansible.inventory_path = 'ansible/inventory/vagrant'
    ansible.playbook = 'ansible/main.yml'
    ansible.verbose = 'v'
    ansible.limit = 'development'

    config.vm.synced_folder HOST_SYNC_DIR, GUEST_SYNC_DIR, owner: 'vagrant', group: 'vagrant'
  end

end
