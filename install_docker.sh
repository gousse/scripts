#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# install docker
echo "# install docker"
ansible-playbook -i $DIR/../ansible/inventory/localhost $DIR/../ansible/docker_local.yml
