#!/bin/bash
#
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

VERSION="v0.28.2"
PLATEFORM="Linux_amd64"

install_k9s (){
  cd $DIR
  curl -L https://github.com/derailed/k9s/releases/download/${VERSION}/k9s_${PLATEFORM}.tar.gz -o k9s.tar.gz
  if [ $? -eq 0 ]; then
     tar xvzf k9s.tar.gz k9s
     chmod 755 $DIR/k9s
     sudo mv $DIR/k9s /usr/local/bin/
  fi
}

echo "# install k9s"
if [ -f /usr/local/bin/k9s ]
then
  echo "/usr/local/bin/k9s is present"
  version=$(k9s version -s |grep -o 'v[0-9]\+\.[0-9]\+\.[0-9]\+')
  latest_version=${VERSION} # to do
  if [ "${version}" == "${latest_version}" ]; then
    echo "k9s is version ${version}"
  else
    echo "upgrading k9s"
    install_k9s
  fi
else
  install_k9s
fi

