export PKG_PATH="$MIRROR/pub/OpenBSD/`uname -r`/packages/`arch -s`/"

# set pkg path for users
echo "export PKG_PATH=\"$PKG_PATH\"" >> /root/.profile
echo "export PKG_PATH=\"$PKG_PATH\"" >> /home/vagrant/.profile

# install wget/curl
pkg_add wget curl

#install the normal flavour of `rsync`
pkg_add -v rsync--

# sudo
echo "vagrant ALL=(ALL) NOPASSWD: SETENV: ALL" >> /etc/sudoers
