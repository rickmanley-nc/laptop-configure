yum -y install ansible
yum -y install git

mkdir /home/rnelson/git
cd /home/rnelson/git
git clone http://github.com/rickmanley-nc/laptop-configure.git
cd /home/rnelson/git/laptop-configure

ansible-playbook -i hosts main.yml -t firewall,myfiles,packages,libvirtd,httpd,vpn,network

cp /usr/share/applications/guake.desktop /etc/xdg/autostart/

source ~/.bashrc
exit 0

# wget -qO- https://github.com/rickmanley-nc/laptop-configure/raw/master/run.sh | sudo bash
