# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version
VAGRANTFILE_API_VERSION = '2'

$shared_folders = {"#{Dir.home}/chef" => '/home/vagrant/chef'}

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = 'chef/debian-7.6'
  config.vm.box_url = 'https://atlas.hashicorp.com/chef/boxes/debian-7.6'

  config.vm.hostname = 'cheftdd'

  #config.vm.network "forwarded_port", guest: 8000, host: 8000

  config.vm.provision 'ansible' do |ansible|
    ansible.sudo = true
    ansible.inventory_path = 'ansible/inventory/vagrant'
    ansible.playbook = 'ansible/main.yml'
    ansible.verbose = 'v'
    ansible.limit = 'development'
  end

  # Uncomment below to enable NFS for sharing the host machine into the VM, e.g.:
  #
  #   config.vm.synced_folder ".", "/home/foo/share", id: "vagrant", :nfs => true, :mount_options => ['nolock,vers=3,udp']
  #
  $shared_folders.each_with_index do |(host_folder, guest_folder), index|
    if File.directory?(host_folder)
      # config.vm.synced_folder host_folder.to_s, guest_folder.to_s, id: config.vm.hostname, nfs: true, mount_options: ['nolock,vers=3,udp'], create: true
      config.vm.synced_folder host_folder.to_s, guest_folder.to_s, id: config.vm.hostname, create: true
    else
      puts "Warning - host_folder #{host_folder.to_s} does not exist"
    end
  end

end
