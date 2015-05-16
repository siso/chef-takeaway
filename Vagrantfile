# -*- mode: ruby -*-
# vi: set ft=ruby :

# CONFIGURATION

# mount directories from host to guest
# shared_folders = {"#{Dir.home}/chef" => '/home/vagrant/chef'}
shared_folders = {}

# VM with gui or headless
vm_gui = false
vm_memory = 1024
vm_cpus = 1
# vm_forward_ssh_port = 20022

# ---- PLEASE, DO NO EDIT AFTER THIS LINE ----

# Vagrantfile API/syntax version
VAGRANTFILE_API_VERSION = '2'


Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = 'chef-takeaway'
  config.vm.box_url = 'http://995e65d53bed216eb15c-0c2f4b0748cddd6b01300aa4c8dccc25.r25.cf4.rackcdn.com/chef-takeaway-wheezy.box'

  # config.ssh.username = 'vagrant'
  # config.ssh.password = 'vagrant'

  config.vm.hostname = 'chef-takeaway'

  # config.vm.network :forwarded_port, guest: 22, host: vm_forward_ssh_port, id: 'ssh', auto_correct: false

  config.vm.provider :virtualbox do |vb|
    vb.gui = vm_gui
    vb.memory = vm_memory
    vb.cpus = vm_cpus
  end

  # Uncomment below to enable NFS for sharing the host machine into the VM, e.g.:
  #
  #   config.vm.synced_folder ".", "/home/foo/share", id: "vagrant", :nfs => true, :mount_options => ['nolock,vers=3,udp']
  #
  shared_folders.each_with_index do |(host_folder, guest_folder), index|
    if File.directory?(host_folder)
      puts "synced folder host_folder:#{host_folder.to_s} --> guest_folder:#{guest_folder.to_s}"
      # config.vm.synced_folder host_folder.to_s, guest_folder.to_s, id: config.vm.hostname, nfs: true, mount_options: ['nolock,vers=3,udp'], create: true
      config.vm.synced_folder host_folder.to_s, guest_folder.to_s, id: config.vm.hostname, create: true
    else
      puts "Warning - host_folder #{host_folder.to_s} does not exist"
    end
  end

end
