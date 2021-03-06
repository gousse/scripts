#!/bin/bash
#
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# prompt sudo if needed
sudo echo -n "" >/dev/null

# manage proxy settings
source $DIR/proxy.sh

# installs
bash $DIR/install_packages.sh
bash $DIR/install_ansible.sh
bash $DIR/install_kubectl.sh
bash $DIR/install_docker.sh
bash $DIR/install_urxvt.sh
bash $DIR/install_go.sh
bash $DIR/install_powerline-go.sh
bash $DIR/install_i3.sh
bash $DIR/install_atom.sh
