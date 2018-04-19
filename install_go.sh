#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "# install go"
ansible-playbook -i $DIR/../ansible/inventory/localhost $DIR/../ansible/go.yml
