#!/bin/bash
#
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# install kubectl
echo "# install latest kubectl"
install_kubectl (){
  cd $DIR
  curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
  if [ $? -eq 0 ]; then
     chmod 755 $DIR/kubectl
     sudo mv $DIR/kubectl /usr/local/bin/kubectl
  fi
}

if [ -f /usr/local/bin/kubectl ]
then
  echo "/usr/local/bin/kubectl is present"
  version=$(kubectl version --client --short --output json |jq -r .clientVersion.gitVersion)
  latest_version=$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)
  if [ "${version}" == "${latest_version}" ]; then
    echo "kubectl is latest version"
  else
    echo "upgrading kubectl"
    install_kubectl
  fi
else
  install_kubectl
fi
