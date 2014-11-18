#!/bin/sh
#
# Install the ports system

set -e

wget "$MIRROR/pub/OpenBSD/`uname -r`/ports.tar.gz" -O /tmp/ports.tar.gz

cd /usr
tar xzf /tmp/ports.tar.gz

rm -f /tmp/ports.tar.gz
