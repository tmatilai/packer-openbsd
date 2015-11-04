#!/bin/sh

set -e

export PKG_PATH="$MIRROR/pub/OpenBSD/`uname -r`/packages/`arch -s`/"

# create vagrant user/group and home directory
groupadd vagrant
adduser -noconfig -unencrypted -batch vagrant vagrant,wheel vagrant vagrant

# set pkg path for users
echo "export PKG_PATH=\"$PKG_PATH\"" >> /root/.profile
echo "export PKG_PATH=\"$PKG_PATH\"" >> /home/vagrant/.profile

# set nameserver to Google's public DNS
echo "nameserver 8.8.8.8" >> /etc/resolv.conf.tail
echo "nameserver 8.8.4.4" >> /etc/resolv.conf.tail

# reapply modified network configs
sh /etc/netstart

# install wget/curl/sudo
pkg_add wget curl sudo--

# sudo
echo "vagrant ALL=(ALL) NOPASSWD: SETENV: ALL" >> /etc/sudoers

# add vagrant pub key
wget --no-check-certificate \
    'https://github.com/mitchellh/vagrant/raw/master/keys/vagrant.pub' \
    -O /home/vagrant/.ssh/authorized_keys
chown -R vagrant /home/vagrant/.ssh
chmod -R go-rwsx /home/vagrant/.ssh
