sudo apt-get update

ssh-keygen -b 4096 -f ~/.ssh/id_rsa -N '' -q
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
cat ~/.ssh/id_rsa.pub >> ~vagrant/.ssh/authorized_keys

echo ~/.ssh/authorized_keys

echo 'Port 2222' | sudo tee -a  /etc/ssh/sshd_config
sudo service ssh reload

sudo apt-get install -y git
git clone https://github.com/siso/vagrant-cheftdd.git

sudo apt-get install -y python-pip python-dev
sudo pip install ansible

cd vagrant-cheftdd/ansible
export ANSIBLE_HOST_KEY_CHECKING=False
ansible-playbook -i inventory/vagrant main.yml --sudo
