#!/bin/bash
#
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# set proxy if needed 
#source proxy.sh

# install apt packages
bash $DIR/install_packages.sh

# install ansible
bash $DIR/install_ansible.sh

# install kubectl
bash $DIR/install_kubectl.sh

# install docker
bash $DIR/install_docker.sh

