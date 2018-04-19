#!/bin/bash
# set proxy and declare where its needed
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

export PROXY_IP=''
#export PROXY_IP=1.2.3.4
export PROXY_PORT=3128

set_proxy() {
  export http_proxy="http://$PROXY_IP:$PROXY_PORT";
  export https_proxy="http://$PROXY_IP:$PROXY_PORT";
  export ftp_proxy="http://$PROXY_IP:$PROXY_PORT";
  # for your local env
  # put the ip addresses associated to lo, docker0 and eth0 interfaces (separated by ,)
  export no_proxy=$(echo `hostname -I|sed "s/ /,/g"`localhost);
}

unset_proxy(){
  unset http_proxy
  unset https_proxy
  unset ftp_proxy
  unset no_proxy
}

if [ -z $PROXY_IP ] ; then
  echo "no proxy set"
  echo "removing env"
  unset_proxy
  echo "remove apt_proxy"
  sudo rm -f /etc/apt/apt.conf.d/apt_proxy
  echo "undeclare system wide"
  ENVPATH=$(grep 'PATH=.*' /etc/environment)
  sudo -E bash -c "echo '$ENVPATH' > /etc/environment"
else
  echo "# set proxy env"
  set_proxy
  echo "# patching proxy for apt"
  sudo -E bash -c "envsubst < $DIR/apt_proxy.template > /etc/apt/apt.conf.d/apt_proxy"
  echo "# patching proxy system wide"
  # preserve actual PATH declaration
  ENVPATH=$(grep 'PATH=.*' /etc/environment)
  sudo -E bash -c "echo '$ENVPATH' > /etc/environment"
  sudo -E bash -c "envsubst < $DIR/proxy.template >> /etc/environment"
fi
