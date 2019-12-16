# Ansible Docker Image

This Docker image contains:

* Python 3
* Ansible (latest version)
* Modified version of ansible-lint from [AnsibleCI/ansible-lint](https://github.com/AnsibleCI/ansible-lint.git)
  
```shell
$ docker run --rm -it ansible:0.0.1 ansible --version
ansible 2.9.1
  config file = None
  configured module search path = ['/root/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /usr/lib/python3.7/site-packages/ansible
  executable location = /usr/bin/ansible
  python version = 3.7.5 (default, Oct 17 2019, 12:25:15) [GCC 8.3.0]
```
