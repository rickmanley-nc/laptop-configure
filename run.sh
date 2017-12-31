sudo yum -y install ansible
sudo yum -y install git

cd ~
mkdir git
cd git
git clone git@github.com:rickmanley-nc/laptop-configure.git
cd laptop-configure

ansible-playbook -i hosts main.yml --ask-sudo-pass -t firewall,myfiles,packages,libvirtd,httpd,openscap,network

sudo cp /usr/share/applications/guake.desktop /etc/xdg/autostart/

source ~/.bashrc
exit 0



# bash wget -qO- https://github.com/rickmanley-nc/laptop-configure/raw/master/run.sh | sudo bash
