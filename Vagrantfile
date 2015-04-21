# -*- mode: ruby -*-
# vi: set ft=ruby :

# CONFIGURATION

# mount directories from host to guest
shared_folders = {"#{Dir.home}/chef" => '/home/vagrant/chef'}

# VM with gui or headless
vm_gui = false
vm_memory = 1024
vm_cpus = 1
vm_forward_ssh_port = 20022

# ---- PLEASE, DO NO EDIT AFTER THIS LINE ----

# Vagrantfile API/syntax version
VAGRANTFILE_API_VERSION = '2'


Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = 'chef/debian-7.6'
  config.vm.box_url = 'https://atlas.hashicorp.com/chef/boxes/debian-7.6'

  config.vm.hostname = 'chef-takeaway-builder'

  config.vm.network :forwarded_port, guest: 22, host: vm_forward_ssh_port, id: 'ssh', auto_correct: false

  config.vm.provider :virtualbox do |vb|
    vb.gui = vm_gui
    vb.memory = vm_memory
    vb.cpus = vm_cpus
  end

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
  shared_folders.each_with_index do |(host_folder, guest_folder), index|
    if File.directory?(host_folder)
      # config.vm.synced_folder host_folder.to_s, guest_folder.to_s, id: config.vm.hostname, nfs: true, mount_options: ['nolock,vers=3,udp'], create: true
      config.vm.synced_folder host_folder.to_s, guest_folder.to_s, id: config.vm.hostname, create: true
    else
      puts "Warning - host_folder #{host_folder.to_s} does not exist"
    end
  end

end
