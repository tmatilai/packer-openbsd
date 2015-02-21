#!/bin/sh

set -e

if [ x$VAGRANT_ANSIBLE = x'yes' ]; then
	. /root/.profile

	uname_r=`uname -r`
	if [ $uname_r = 5.6 ]; then
		pkg_add python-3.4.1
	elif [ $uname_r = 5.5 ]; then
		pkg_add python-3.3.2p1
	elif [ $uname_r = 5.4 ]; then
		pkg_add python-3.3.2
	else
		echo "Did not recognise OpenBSD version."
		exit 1
	fi
else
	echo "Building a box without Python 3 (Ansible)"
fi
