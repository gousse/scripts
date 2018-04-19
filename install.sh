#!/bin/bash
#
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# set proxy if needed 
#source proxy.sh

# install apt packages
bash $DIR/install_packages.sh

bash $DIR/install_ansible.sh

bash $DIR/install_kubectl.sh

bash $DIR/install_docker.sh

bash $DIR/install_urxvt.sh

bash $DIR/install_go.sh
