#!/bin/sh

set -e

uname_r=`uname -r`

export PKG_PATH="$MIRROR/pub/OpenBSD/`uname -r`/packages/`arch -s`/"

# set pkg path for users
echo "export PKG_PATH=\"$PKG_PATH\"" >> /root/.profile
echo "export PKG_PATH=\"$PKG_PATH\"" >> /home/vagrant/.profile

# install wget, curl, and sudo on 5.8
pkg_add wget curl
if [ $uname_r = 5.8 ]; then
    pkg_add sudo--
fi

# sudo
echo "vagrant ALL=(ALL) NOPASSWD: SETENV: ALL" >> /etc/sudoers

