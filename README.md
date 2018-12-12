# Using Ansible to Configure Laptop - SA
Need to create kickstart file and test against PXE
## latest updates ##
A few items failed during a Fedora 28 install on Sept 14, 2018:
- /etc/libvirt/storage did not exist
- need to install libselinux-python
- firewall command needed to be commented out. I think this is because python3 modules for firewalld are not fully supported by ansible upstream. Need to doublecheck. As a workaround, I just commented out the firewall section, but I manually opened the ports necessary.
- the VPN.yml playbook failed when run from the original wget. However, manually running it was successful.

## Requirements and Steps
- Fedora installed
  - 32 GiB RAM (16 GiB Minimum)
  - "/" 40 GiB
  - "/home/" 200+ GiB
  - "/boot" 200 MiB
  - "swap" 6 GiB
  - Set hostname to laptop.rnelson-demo.com
- Modify group_vars/all and vpn.yml vars in github.
- Execute the following command to pull down the run.sh script which will configure the environment:
  - wget -qO- https://github.com/rickmanley-nc/laptop-configure/raw/master/run.sh | bash
- If you don't want to run the vpn.yml playbook, edit this out of run.sh. This could be cleaner..
- Download RHEL 7.4 ISO

## Roles

- firewall (configure firewall ports for SSH and HTTP/HTTPS)
  - Currently, May 4, 2018, a bug exists: https://github.com/ansible/ansible/issues/38161. I have added 'ignore_errors' to the role, but once the bug is fixed, this should be removed.
- packages (installs packages)
- myfiles (local files needing to be copied to laptop)
- libvirtd (configures libvirtd for eventual provisioning with Satellite)
- httpd (configures httpd for eventual kickstarting and hosting of files)
- create-libvirt-network (creates libvirt network, the eventual DEMO-environment)

## Vars

All variables are located in `group_vars/all`. Update that file with your environment details.

## Tags

- firewall
- myfiles
- packages
- libvirtd
- httpd
- network
- vpn

## Remaining Items to Complete

- Consider adding the following to disable Ansible's host key checking. Since we could be redeploying the same hostname/ip multiple times, this makes life easier:
  - # uncomment this to disable SSH key host checking
  - host_key_checking = False
- VPN configuration works fine, but the prompt doesn't work inside of a role. Not sure why yet, which is why the run.sh has 2 separate playbooks...main.yml and vpn.yml.
- Change libvirtd role to use 'virt', 'virt_net', and 'virt_pool' modules.
- YubiKey configuration.
- For kickstarting of VMs, current method is to use the Binary DVD and use a kickstart file. This works fine, but we could also use 'reposync' to then have the ostree available over HTTP, and still use a kickstart file. This would drastically increase the laptop-configure setup time though. Need to ponder on if it's just easier to download the ISOs:
  - download RHEL 7.4 ISO and store in /home/rnelson/Images/original
  - download Fedora 27 ISO and store in /home/rnelson/Images/original (this is for Ansible Workshop VM build)
- include private and public ssh key
- https://developer.microsoft.com/en-us/windows/downloads/virtual-machines
- Update ansible hosts file.
- Update /etc/hosts file

## License

Red Hat, the Shadowman logo, Ansible, and Ansible Tower are trademarks or registered trademarks of Red Hat, Inc. or its subsidiaries in the United States and other countries.

All other parts of this project are made available under the terms of the [MIT License](LICENSE).
