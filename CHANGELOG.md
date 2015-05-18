# vagrant-cheftdd CHANGELOG

## NEW (minor version has to change)
- [Simone Soldateschi] - Fix minor issues
- [Simone Soldateschi] - Split Chef play into multiple parts, disable openstack play
- [Simone Soldateschi] - Merge branch 'jessie' into devel
- [Simone Soldateschi] - Simplify run by moving ./vagrant/Vagrantfile to ./
- [Simone Soldateschi] - Move ./Vagrantfile to ./ansible dir, to provision locally
- [Simone Soldateschi] - Install jq, kitchen-azure, httpie and iPython
- [Simone Soldateschi] - Remove stuff to build image based on Debian Wheezy
- [Simone Soldateschi] - Build chef-takeaway based on Debian Jessie amd64 completes

## 0.2.0
- [Simone Soldateschi] - Upload Vagrant box in the Cloud, enhance documentation

## 0.1.9
- [Simone Soldateschi] - Fix issues with VBoxAdditions and vboxfs

## 0.1.8
- [Simone Soldateschi] - Add `./vagrant/Vagrantfile` to run 'chef-takeaway.box'
- [Simone Soldateschi] - Add user 'foo', to develop Chef stuff
- [Simone Soldateschi] - Fix Packer provisioning with Ansible

## 0.1.7
- [Simone Soldateschi] - Install OpenStack clients

## 0.1.6
- [Simone Soldateschi] - Add TrevisCI integration

## 0.1.5
- [Simone Soldateschi] - Update Debian alternatives (e.g. set Vim as default editor)

## 0.1.4
- [Simone Soldateschi] - Use Packer to build VirtualBox box, and Ansible to provision it

## 0.1.3
- [Simone Soldateschi] - Add Vagrant plugins for main Cloud providers

## 0.1.2
- [Simone Soldateschi] - Add Vagrant, inside Vagrant

## 0.1.1
- [Simone Soldateschi] - Add Polipo proxy

## 0.1.0
- [Simone Soldateschi] - Initial release of vagrant-cheftdd
