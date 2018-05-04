sudo yum -y install ansible
sudo yum -y install git

mkdir /home/rnelson/git
cd /home/rnelson/git
git clone git@github.com:rickmanley-nc/laptop-configure.git
cd /home/rnelson/git/laptop-configure

ansible-playbook -i hosts main.yml --ask-become-pass
ansible-playbook -i hosts vpn.yml --ask-become-pass -k

source ~/.bashrc
exit 0

# wget -qO- https://github.com/rickmanley-nc/laptop-configure/raw/master/run.sh | bash
