#!/bin/bash
#
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# install apt packages
sudo -E apt-get update
sudo -E apt-get install -y \
  jq \
  netcat-traditional \
  vim \
  rxvt-unicode-256color \
  i3
