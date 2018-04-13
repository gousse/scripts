#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "# install apt dependencies"
sudo -E apt-get update
sudo -E apt-get install -y build-essential libssl-dev libffi-dev python-dev python-minimal python-setuptools unzip gettext 

sudo -E easy_install pip

echo "# patching for ansible"
envsubst < $DIR/../ansible/group_vars/all.template >  $DIR/../ansible/group_vars/all

# install ansible
echo "# install ansible"
#sudo -E -H pip install pip ansible==2.4.3 --upgrade
sudo -E -H pip install pip ansible --upgrade

echo "# upgrade pyOpenSSL to the latest version (>=16)"
sudo -E -H pip install pip pyOpenSSL --upgrade
