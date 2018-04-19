# scripts
my scripts to installed my prefered environments

you can use install.sh to launch all

or select the one you want individually.

for the proxy declaration, edit proxy.sh and set proxy_ip as needed

## install.sh
install all

## proxy.sh
declare a proxy and set it in environment, for apt, and systemwide
in /etc/environment

## install_packages.sh
install some default apt packages, some needed for exemple for ansible

## install_ansible.sh
pip install latest ansible version

## install_kubectl.sh
install latest kubectl binary

## install_docker.sh
install latest docker-ce with docker repo

## install urxvt
install urxvt and my default settings

## install go
install golang, version is in ansible/group_vars, or set go_version var

## install powerline-go
install go version of powerline shell, and set its default conf in
~/.config/powerline-go/config.sh
you can change it, because no overwrite if this conf exist


