#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

VERSION="1.19.5"
echo "# install go"

curl -JLO "https://go.dev/dl/go${VERSION}.linux-amd64.tar.gz"
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go${VERSION}.linux-amd64.tar.gz


echo " add to your ~/.profile"
cat << EOF
# set PATH for go
if [ -d "/usr/local/go/bin" ] ; then
  PATH="\$PATH:/usr/local/go/bin"
fi

if [ -d "\$HOME/go/bin" ] ; then
  PATH="\$PATH:\$HOME/go/bin"
fi
EOF
