# ansible-home-lab
Ansible playbooks and roles supporting service deployment in a home lab environment

# Running The Playbooks
## Pre-requisites
```
apt install python3.8-venv
```

## Environment config
```
git clone git@github.com:Marcellod1/ansible-home-lab.git
cd ansible-home-lab

python3 -m venv venv
source venv/bin/activate
pip install --upgrade pip
pip install -r requirements.txt
```