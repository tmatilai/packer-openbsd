#!/bin/sh

set -e

uname_r=`uname -r`

export PKG_PATH="$MIRROR/pub/OpenBSD/$uname_r/packages/`arch -s`/"

# set pkg path for users
echo "export PKG_PATH=\"$PKG_PATH\"" >> /root/.profile
echo "export PKG_PATH=\"$PKG_PATH\"" >> /home/vagrant/.profile

# install sudo on 5.8, required by Vagrant 1.7.4
if [ $uname_r = 5.8 ]; then
    pkg_add sudo--
elif [ $uname_r = 5.9 ]; then
    pkg_add sudo-1.8.15
elif [ $uname_r = 6.0 ]; then
    pkg_add sudo-1.8.17.1
elif [ $uname_r = 6.1 ]; then
    pkg_add sudo-1.8.19.2
else
    echo "Not installing sudo as your version isn't defined as requiring it in postinstall.sh"
    exit 1
fi

# sudo
echo "vagrant ALL=(ALL) NOPASSWD: SETENV: ALL" >> /etc/sudoers
