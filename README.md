# Using Ansible to Configure Laptop - SA

## latest updates ##
Notes from Sept 5 F30 Install:
1. Changes 'hosts' in main.yml to 'localhost'
2. 2 packages did not exist, python-pyghmi, vlc
3. /etc/libvirt/storage did not exist error happened again, but the path is definitely there. I manually finished the rest of the libvirt role, and ran with --tags on the libvirt network and httpd roles just fine.
4. vpn playbook failed

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


