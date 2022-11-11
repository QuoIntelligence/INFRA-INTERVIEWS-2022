# Vagrant - Ansible Docker Swarm

## Install Requirements

### VirtualBox
Host Network Manager: Configure a Host-Only network vboxnet0 192.168.56.1/24 without DHCP

### Vagrant
This box will be downloaded using Vagrantfile

https://app.vagrantup.com/geerlingguy/boxes/debian10

Vagrant plugins: vagrant-hostmanager vagrant-share vagrant-vbguest

```
vagrant plugin install vagrant-hostmanager
vagrant plugin install vagrant-share
vagrant plugin install vagrant-vbguest
```

### Ansible

**WARNING!!!**

**Please review whichever piece of code you download from The Internet**

**Use trusted sources and test them**

**WARNING !!!**


ansible.cfg file for Ansible configurations in this test
```
inventory = ./inventory/hosts.yml
roles_path = ./roles
```

## Deployment
### Infra
Vagrantfile creates box1, box2 and box3 based on a Debian 10

```
vagrant init
vagrant up
```
Vagrant's hostmanager-plugin may ask you for permissions to change your /etc/hosts

It updates host and guest /etc/hosts for reaching boxes using its names

## Test ssh access to box1 box2 box3

```
ssh -i ~/.vagrant.d/insecure_private_key vagrant@box1
```

```
vagrant ssh box1
vagrant ssh box2
vagrant ssh box3
```
## Test ssh access from ansible

```
ansible all -m ping

box1 | SUCCESS => {
    "changed": false,
    "ping": "pong"
}
box3 | SUCCESS => {
    "changed": false,
    "ping": "pong"
}
box2 | SUCCESS => {
    "changed": false,
    "ping": "pong"
}
```

### Run a playbook
```
ansible-playbook playbook.yml
```

