# Using Ansible to Configure Laptop - SA

## Requirements and Steps
- Fedora installed
  - 32 GiB RAM (16 GiB Minimum)
  - "/" 40 GiB
  - "/home/" 200+ GiB
  - "/boot" 200 MiB
  - "swap" 6 GiB
- Set hostname to laptop.rnelson-demo.com
- Install Atom from <https://atom.io/>
  - "Ctrl + Shift + P", install Beautify and File Icons
- Modify the following files with the correct variables for environment
  - /home/rnelson/git/laptop-configure/group_vars/all
- Execute the following command to pull down the run.sh script which will configure the environment and execute the main.yml playbook
  - bash wget -qO- https://github.com/rickmanley-nc/laptop-configure/raw/master/run.sh | sudo bash

## Roles

- firewall (configure firewall ports for SSH and HTTP/HTTPS)
- packages (install necessary packages)
- myfiles (local files needing to be copied to laptop)
- libvirtd (configures libvirtd)
- httpd (configures httpd for hosting necessary files)
- openscap (makes separate directory, clone GitHub for scap-security-guide, copy combine-tailoring.py)
- create-libvirt-network (creates libvirt network from user defined variables)
- vpn-profiles (sets up SSH tunnel to Red Hat servers to download pre-configured VPN profiles)

## Vars

All variables are located in `group_vars/all`. Update that file with your environment details.

## Tags

- firewall
- myfiles
- packages
- libvirtd
- httpd
- openscap
- network

## Remaining Items to Complete

- include private and public ssh key
- automate installation of Atom and Beutify / File Icons
- store inventory-tower-initial-setup and manifest-rnelson-sales.zip
- https://developer.microsoft.com/en-us/windows/downloads/virtual-machines   and convert `qemu-img convert -f vmdk WinDev1710Eval-disk1.vmdk -O qcow2 WinDev1710Eval-disk1.qcow`

## License

Red Hat, the Shadowman logo, Ansible, and Ansible Tower are trademarks or registered trademarks of Red Hat, Inc. or its subsidiaries in the United States and other countries.

All other parts of this project are made available under the terms of the [MIT License](LICENSE).
