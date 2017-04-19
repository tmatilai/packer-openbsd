#!/bin/sh

set -e

if [ x$CHEF_VERSION = x'provisionerless' ]; then
  echo "Building a box without Chef"
else
  . /root/.profile

  uname_r=`uname -r`
  # OpenBSD 5.6 has .545p0, 5.5 has .484p0, 5.4 has .448, 6.0's version of 1.8 does not have Ruby Gems
  if [ $uname_r = 5.6 ]; then
    pkg_add ruby-1.9.3.545p0
    version=19
  elif [ $uname_r = 5.5 ]; then
    pkg_add ruby-1.9.3.484p0
    version=19
  elif [ $uname_r = 6.0 ]; then
    pkg_add ruby-2.2.5p1
    version=22
  elif [ $uname_r = 6.1 ]; then
    pkg_add ruby-2.4.1
    version=24
  else
    pkg_add ruby-1.8.7.374p5
    version=18
  fi

  for f in ruby erb irb rdoc ri rake gem testrb \
      chef-apply chef-client chef-shell chef-solo chef-zero \
      knife ohai shef; do
      ln -sf ${f}$version /usr/local/bin/$f
  done
  ln -sf /usr/local/bin/testrb$version /usr/local/bin/testrb 

  if [ x$CHEF_VERSION == x'latest' ]; then
    gem install chef --no-ri --no-rdoc
  elif [ x$CHEF_VERSION == x'prerelease' ]; then
    gem install chef --no-ri --no-rdoc --pre
    $chef_installer -p
  else
    gem install chef --no-ri --no-rdoc --version="$CHEF_VERSION"
  fi

fi
