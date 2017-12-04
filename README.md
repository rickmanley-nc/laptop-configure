# Using Ansible to Configure Laptop - SA

## Requirements and General Steps
- Fedora installed
  - 32 GiB RAM (16 GiB Minimum)
  - "/" 40 GiB
  - "/home/" 200+ GiB
  - "/boot" 200 MiB
  - "swap" 6 GiB
- Set hostname to laptop.rnelson-demo.com
- `yum install ansible git`
- `mkdir /home/rnelson/git ; cd /home/rnelson/git`
- `git clone git@github.com:rickmanley-nc/laptop-configure.git`
- `cd /home/rnelson/git/laptop-configure`
- Install Atom from <https://atom.io/>
  - "Ctrl + Shift + P", install Beautify and File Icons
- Modify the following files with the correct variables for your environment
  - /home/rnelson/git/laptop-configure/group_vars/all
- `ansible-playbook -i "localhost," -c local main.yml -t firewall,packages,libvirtd,httpd,openscap`
- `ansible-playbook -i "localhost," -c local main.yml -t network`

## Roles

- firewall (configure firewall ports for SSH and HTTP/HTTPS)
- packages (install necessary packages)
- libvirtd (configures libvirtd)
- httpd (configures httpd for hosting necessary files)
- openscap (makes separate directory, clone GitHub for scap-security-guide, copy combine-tailoring.py)
- create-libvirt-network (creates libvirt network from user defined variables)

## Vars

All variables are located in `group_vars/all`.

## Tags

- firewall
- packages
- libvirtd
- httpd
- openscap
- network

## Remaining Items to Complete


## License

Red Hat, the Shadowman logo, Ansible, and Ansible Tower are trademarks or registered trademarks of Red Hat, Inc. or its subsidiaries in the United States and other countries.

All other parts of this project are made available under the terms of the [MIT License](LICENSE).
