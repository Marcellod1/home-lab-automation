# ansible-home-lab
Ansible playbooks and roles supporting service deployment in a home lab environment

# Environment Setup
Install project dependencies
```
apt install python3-venv
```
Clone down the repository and confgigure the project environment
```
git clone git@github.com:Marcellod1/ansible-home-lab.git
cd ansible-home-lab
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
```
# Playbooks
## provision_docker.yml
Installs docker, associated plugins, and configures a docker user and group for a ready to go "out of the box" docker development experience.

```
ansible-playbook provision_docker.yml -l <INVENTORY_HOST_OR_GROUP>
```

## provision_nginx_proxy_manager.yml
Installs and configures Docker, along with pulling down and running a containerized instance of Nginx Proxy Manger.
```
ansible-playbook provision_nginx_proxy_manager.yml -l <INVENTORY_HOST_OR_GROUP>
```