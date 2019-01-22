sudo yum -y install ansible
sudo yum -y install git

cd $(mktemp -d)
git clone git@github.com:rickmanley-nc/laptop-configure.git
cd laptop-configure

ansible-playbook main.yml --ask-become-pass
ansible-playbook vpn.yml --ask-become-pass -k

source ~/.bashrc
exit 0

# wget -qO- https://github.com/rickmanley-nc/laptop-configure/raw/master/run.sh | bash
