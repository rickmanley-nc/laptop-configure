# Using Ansible to Configure Laptop - SA

## Requirements and General Steps

- Fedora installed
  - 32 GiB RAM
  - "/" 50 GiB
  - "/home/" 200+ GiB
  - "/boot" 200 MiB
  - "swap" 6 GiB
- `yum install ansible`
- `mkdir /home/rnelson/git`
- `cd /home/rnelson/git/laptop-configure`
- `git clone https://www.github.com/rickmanley-nc/laptop-configure`
- Install Atom from <https://atom.io/>
- Modify the following files with the correct variables for your environment
  - /home/rnelson/git/laptop-configure/group_vars/all
  - /home/rnelson/git/laptop-configure/roles/create-libvirt-network/vars/main.yml
- `ansible-playbook -i "localhost," -c local main.yml -t firewall,packages,libvirtd,httpd`
- `ansible-playbook -i "localhost," -c local main.yml -t network`

# Roles

- firewall (configure firewall ports for SSH and HTTP/HTTPS)
- packages (install necessary packages)
- libvirtd (configures libvirtd)
- httpd (configures httpd for hosting necessary files)
- create-libvirt-network (creates libvirt network from user defined variables)

# Vars


# Tags

- firewall
- packages
- libvirtd
- httpd
- network


# License

Red Hat, the Shadowman logo, Ansible, and Ansible Tower are trademarks or registered trademarks of Red Hat, Inc. or its subsidiaries in the United States and other countries.

All other parts of this project are made available under the terms of the [MIT License](LICENSE).
