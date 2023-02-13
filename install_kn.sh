#!/bin/bash
#
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

VERSION="v1.9.0"
PLATEFORM="linux-amd64"

# install knative cli
install_kn (){
  cd $DIR
  curl -L https://github.com/knative/client/releases/download/knative-${VERSION}/kn-${PLATEFORM} -o kn
  if [ $? -eq 0 ]; then
     chmod 755 $DIR/kn
     sudo mv $DIR/kn /usr/local/bin/
  fi
}

install_quickstart (){
  cd $DIR
  curl -L https://github.com/knative-sandbox/kn-plugin-quickstart/releases/download/knative-${VERSION}/kn-quickstart-${PLATEFORM} -o kn-quickstart
  if [ $? -eq 0 ]; then
     chmod 755 $DIR/kn-quickstart
     sudo mv $DIR/kn-quickstart /usr/local/bin/
  fi
}

echo "# install kn CLI"
if [ -f /usr/local/bin/kn ]
then
  echo "/usr/local/bin/kn is present"
  version=$(kn version -o json | jq -r .Version)
  latest_version=${VERSION} # to do
  if [ "${version}" == "${latest_version}" ]; then
    echo "kn is version ${version}"
  else
    echo "upgrading kn"
    install_kn
  fi
else
  install_kn
fi

echo "# install kn quickstart plugin"
if [ -f /usr/local/bin/kn-quickstart ]
then
  echo "/usr/local/bin/kn-quickstart is present"
  version=$(kn-quickstart version |grep Version | tr -d '[:space:]'|cut -d':' -f2)
  latest_version=${VERSION} # to do
  if [ "${version}" == "${latest_version}" ]; then
    echo "kn-quickstart is version ${version}"
  else
    echo "upgrading kn-quickstart"
    install_quickstart
  fi
else
  install_quickstart
fi
