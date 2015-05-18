# Set up Vagrant.

date > /etc/vagrant_box_build_time

# Create the user vagrant with password vagrant
# this task is already accomplished in preseed-jessie.cfg
# useradd -G sudo -p $(perl -e'print crypt("vagrant", "vagrant")') -m -s /bin/bash -N vagrant

echo 'vagrant    ALL=(ALL)  NOPASSWD:ALL' >> /etc/sudoers

# Install vagrant keys
mkdir -pm 700 /home/vagrant/.ssh
curl -Lo /home/vagrant/.ssh/authorized_keys 'https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub'
chmod 0600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant:vagrant /home/vagrant/.ssh

# Customize the message of the day
echo 'Welcome to your Vagrant-built virtual machine.' > /var/run/motd
