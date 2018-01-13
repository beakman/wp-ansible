# WordPress Ansible Setup

Based on [Hosting WordPress Yourself](https://github.com/A5hleyRich/wordpress-ansible/blob/master/provision.yml)

## Usage

Configure your [hosts file](https://github.com/beakman/wp-ansible/blob/master/hosts).

```
[production]
192.168.1.1 #sampledomain.com
```

Edit [provision.yml](https://github.com/beakman/wp-ansible/blob/master/provision.yml) and [install_wp.yml](https://github.com/beakman/wp-ansible/blob/master/install_wp.yml)to configure your settings.

Run:

`ansible-playbook provision.yml`

then `ansible-playbook install_wp.yml`