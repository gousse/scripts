#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

sudo echo "" >/dev/null
ansible-playbook -i $DIR/../ansible/inventory/localhost $DIR/../ansible/powerline-go.yml
