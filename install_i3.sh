#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

sudo echo -n "" >/dev/null
/usr/lib/apt/apt-helper download-file http://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2018.01.30_all.deb keyring.deb SHA256:baa43dbbd7232ea2b5444cae238d53bebb9d34601cc000e82f11111b1889078a
sudo dpkg -i ./keyring.deb
rm -f ./keyring.deb
sudo bash -c "echo "deb http://debian.sur5r.net/i3/ $(grep '^DISTRIB_CODENAME=' /etc/lsb-release | cut -f2 -d=) universe" >> /etc/apt/sources.list.d/sur5r-i3.list"
sudo apt update
sudo apt install i3

I3CONF=$(cd $DIR/../i3 && pwd)
mkdir -p ~/.config/i3
rm -f ~/.config/i3/config
ln -s $I3CONF/config ~/.config/i3/config