# chef-takeaway

[![Build Status](https://travis-ci.org/siso/chef-takeaway.png)](https://travis-ci.org/siso/chef-takeaway)

version: 0.3.1

## Synopsis

Takeaway box to get cracking on Chef, Vagrant, Ansible, Test Kitchen and Docker

## Prerequisites
You will need the following software on your local host:
- [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
- [Vagrant](http://www.vagrantup.com/downloads.html)
- Git client

## Quickstart

Just clone this repo, and run Vagrant:

```shell
git clone git@github.com:siso/chef-takeaway.git
cd chef-takeaway
vagrant up
```

Login to the *chef-takeaway* box:

```shell
vagrant ssh -- -A
```

where `-A` enables forwarding of the authentication agent connection.

## How-to and Info

### Directories

- `ansible` -- Ansible playbook to provision *chef-takeaway* Vagrant box
- `packer` -- Packer templates and stuff to create *chef-takeaway* box from scratch

### Develop Chef Cookbook

Start cooking with [Chef](https://www.chef.io/):

```shell
cd chef
berks cookbook helloworld
```

**WARNING** - `~/chef` directory is mounted from host onto guest system in `/home/vagrant/chef`. *Files and dirs in `/home/vagrant/chef` deleted on the guest machine, are deleted on the host machine too!*

## Test Kitchen drivers

List of Test Kitchen drivers currently being installed:

```shell
$ kitchen driver discover
    Gem Name                          Latest Stable Release
    jackal-kitchen-slack              0.1.2
    kitchen-all                       0.2.0
    kitchen-ansible                   0.0.10
    kitchen-azure                     0.1.0
    kitchen-binding                   0.2.2
    kitchen-bluebox                   0.6.2
    kitchen-cabinet                   3.0.0
    kitchen-cfengine                  0.0.5
    kitchen-chef-extended-attributes  0.2.0
    kitchen-cloudstack                0.20.0
    kitchen-digital_ocean             0.4.0
    kitchen-digitalocean              0.8.3
    kitchen-docker                    1.7.0
    kitchen-docker-api                0.4.0
    kitchen-docker_cli                0.8.0
    kitchen-driver-vagrant_provision  1.0.0
    kitchen-ec2                       0.8.0
    kitchen-environment               0.1.5
    kitchen-fifo                      0.1.0
    kitchen-fog                       0.7.3
    kitchen-gce                       0.2.0
    kitchen-goiardi                   0.1.1
    kitchen-inspector                 1.3.0
    kitchen-itamae                    0.2.3
    kitchen-joyent                    0.2.2
    kitchen-libvirtlxc                0.4.0
    kitchen-local                     0.0.1
    kitchen-lxc                       0.1.4
    kitchen-opennebula                0.1.1
    kitchen-openstack                 1.7.1
    kitchen-puppet                    0.0.24
    kitchen-rackspace                 0.14.0
    kitchen-rightscale                0.1.0
    kitchen-salt                      0.0.19
    kitchen-scribe                    0.3.1
    kitchen-sharedtests               0.2.0
    kitchen-ssh                       0.0.7
    kitchen-sshgzip                   0.0.3
    kitchen-sync                      1.0.1
    kitchen-vagrant                   0.15.0
    kitchen-vagrant_sandbox           0.1.1
    kitchen-vagrant_winrm             0.3.0
    kitchen-vsphere                   0.2.0
    kitchen-zcloudjp                  0.5.0
    test-kitchen-provisioners         0.1
```

## Vagrant

Supported Cloud Providers:

```shell
$ vagrant plugin list
vagrant-aws (0.6.0)
vagrant-azure (1.1.1)
vagrant-digitalocean (0.7.3)
vagrant-google (0.1.4)
vagrant-proxyconf (1.5.0)
vagrant-rackspace (0.1.10)
vagrant-share (1.1.3, system)
```

## Packer

Build server image with Packer and Ansible:

```shell
cd packer/
packer build debian-8.0.0-amd64-virtualbox.json
# this will take quite a long time
vagrant box add virtualbox/chef-takeaway-jessie.box
```

## Windows users

Download and install your favourite Git client, e.g. [msysgit](https://msysgit.github.io/).

Windows users may need to link Vagrant to the Git SSH client, by adding `"C:\Users\<USER_NAME>\AppData\Local\Programs\Git\bin"` to the Path environment variable.


## Contribute

- Fork the repository on Github
- Create a named feature branch (like add_component_x)
- Write your change
- Write tests for your change (if applicable)
- Run the tests, ensuring they all pass
- Submit a Pull Request using Github

## Authors

- Author:: Simone Soldateschi (simone.soldatechi@gmail.com)

## License

Copyright (C) 2015 Simone Soldateschi

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program. If not, see [http://www.gnu.org/licenses/](http://www.gnu.org/licenses/).
