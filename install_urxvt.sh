#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

sudo echo "" >/dev/null
echo "# install uxrvt"
ansible-playbook -i $DIR/../ansible/inventory/localhost $DIR/../ansible/urxvt.yml
