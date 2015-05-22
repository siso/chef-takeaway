# -*- mode: ruby -*-
# vi: set ft=ruby :

# CONFIGURATION

# mount directories from host to guest
shared_folders = {"#{Dir.home}/chef" => '/home/vagrant/chef'}
# shared_folders = {}

# VM with gui or headless
vm_gui = false
vm_memory = 1024
vm_cpus = 1
# vm_forward_ssh_port = 20022

# copy SSH key and config files from host to guest box
copy_ssh_files = true

# ---- PLEASE, DO NO EDIT AFTER THIS LINE ----

# Vagrantfile API/syntax version
VAGRANTFILE_API_VERSION = '2'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = 'chef-takeaway-0.3.1'
  config.vm.box_url = 'http://b978c36202e860131550-3189a12cbb993ba67efdf7b3557152c8.r36.cf4.rackcdn.com/virtualbox/chef-takeaway-0.3.1.box'

  # config.ssh.username = 'vagrant'
  # config.ssh.password = 'vagrant'

  config.vm.hostname = 'chef-takeaway'
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
      config.vm.synced_folder host_folder.to_s, guest_folder.to_s, id: config.vm.hostname, create: true, mount_options: ["umask=0000"]
    else
      puts "Warning - host_folder #{host_folder.to_s} does not exist"
    end
  end

  # copy files to guest box
  config.vm.provision "file", source: "~/.gitconfig", destination: ".gitconfig"
  config.vm.provision "file", source: "#{Dir.home}/.ssh/config", destination: ".ssh/config"
  config.vm.provision "file", source: "#{Dir.home}/.ssh/id_rsa", destination: ".ssh/id_rsa"
  config.vm.provision "file", source: "#{Dir.home}/.ssh/id_rsa.pub", destination: ".ssh/id_rsa.pub"
  
  # Fix up file permissions for SSH private key
  config.vm.provision "shell", inline: "chmod 400 .ssh/id_rsa"
end
