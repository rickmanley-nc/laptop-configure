# Using Ansible to Configure Laptop - SA

## latest updates ##

A few items failed during a Fedora 28 install on Sept 14, 2018:
- /etc/libvirt/storage did not exist
- firewall command needed to be commented out. I think this is because python3 modules for firewalld are not fully supported by ansible upstream. Need to doublecheck. As a workaround, I just commented out the firewall section, but I manually opened the ports necessary.
- the VPN.yml playbook failed when run from the original wget. However, manually running it was successful.

## Requirements and Steps
- Modify `group_vars/all` , `run.sh` , and `vpn.yml`
- Execute the following command to pull down the run.sh script which will configure the laptop:
  - wget -qO- https://github.com/rickmanley-nc/laptop-configure/raw/master/run.sh | bash

## Roles

- firewall - configure firewall ports for SSH and HTTP/HTTPS
- packages - installs packages
- myfiles - local files needing to be copied to laptop
- libvirtd - configures libvirtd to allow Satellite to have libvirtd as a provider for provisioning from Satellite
- httpd - configures httpd for kickstart and hosting files
- create-libvirt-network - creates laptop network for DEMO-environment

## Remaining Items to Complete

- Create kickstart file and test against PXE
- VPN configuration works, but the prompt for 2FA doesn't work inside of a role. Not sure why yet, which is why the run.sh has 2 separate playbooks...main.yml and vpn.yml.
- Change libvirtd role to use 'virt', 'virt_net', and 'virt_pool' modules.

## License

Red Hat, the Shadowman logo, Ansible, and Ansible Tower are trademarks or registered trademarks of Red Hat, Inc. or its subsidiaries in the United States and other countries.

All other parts of this project are made available under the terms of the [MIT License](LICENSE).
