#!/bin/bash
#
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

VERSION="v1.9.0"
PLATEFORM="linux-amd64"

# install knative cli
echo "# install latest kn CLI"
install_kn (){
  cd $DIR
  curl -L https://github.com/knative/client/releases/download/knative-${VERSION}/kn-${PLATEFORM} -o kn
  if [ $? -eq 0 ]; then
     chmod 755 $DIR/kn
     sudo mv $DIR/kn /usr/local/bin/
  fi
}

if [ -f /usr/local/bin/kn ]
then
  echo "/usr/local/bin/kn is present"
  version=$(kn version)
  latest_version=$(kn version) # to do
  if [ "${version}" == "${latest_version}" ]; then
    echo "kubectl is version ${version}"
  else
    echo "upgrading kn"
    install_kn
  fi
else
  install_kn
fi
