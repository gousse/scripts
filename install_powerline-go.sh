#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# install default
sudo echo "" >/dev/null
ansible-playbook -i $DIR/../ansible/inventory/localhost $DIR/../ansible/powerline-go.yml

# use specific config
rm -f $HOME/.config/powerline-go/config.sh
POWERCONF=$(cd $DIR/../powerline-go && pwd)
ln -s $POWERCONF/config.sh $HOME/.config/powerline-go/config.sh
