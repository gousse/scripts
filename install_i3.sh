#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

sudo bash -c "/usr/lib/apt/apt-helper download-file https://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2020.02.03_all.deb keyring.deb SHA256:c5dd35231930e3c8d6a9d9539c846023fe1a08e4b073ef0d2833acd815d80d48"
sudo bash -c "dpkg -i ./keyring.deb"
sudo bash -c "echo "deb https://debian.sur5r.net/i3/ $(grep '^DISTRIB_CODENAME=' /etc/lsb-release | cut -f2 -d=) universe" >> /etc/apt/sources.list.d/sur5r-i3.list"
sudo apt update
sudo apt install i3

I3CONF=$(cd $DIR/../i3 && pwd)
mkdir -p ~/.config/i3
rm -f ~/.config/i3/config
ln -s $I3CONF/config ~/.config/i3/config
