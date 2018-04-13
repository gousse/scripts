#!/bin/bash
# install docker
echo "# install docker"
ansible-playbook -i $DIR/../ansible/inventory/localhost $DIR/../ansible/docker_local.yml
