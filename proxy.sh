#!/bin/bash
# set proxy and declare where its needed
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

export PROXY_IP=localhost
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
}

set_proxy


# declare proxy 
echo "# patching for ansible"
envsubst < $DIR/../ansible/group_vars/all.template >  $DIR/../ansible/group_vars/all

echo "# patching proxy for apt"
sudo -E bash -c "envsubst < $DIR/apt_proxy.template > /etc/apt/apt.conf.d/apt_proxy"

echo "# patching proxy system wide"
# preserve actual PATH declaration
ENVPATH=$(grep 'PATH=.*' /etc/environment)
sudo -E bash -c "echo '$ENVPATH' > /etc/environment"
sudo -E bash -c "envsubst < $DIR/proxy.template >> /etc/environment"
