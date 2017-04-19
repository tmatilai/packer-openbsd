#!/bin/sh

set -e

if [ x$VAGRANT_ANSIBLE = x'yes' ]; then
	. /root/.profile

	uname_r=`uname -r`
	if [ $uname_r = 6.1 ]; then
		pkg_add python-2.7.13p0
	elif [ $uname_r = 6.0 ]; then
		pkg_add python-2.7.12
	elif [ $uname_r = 5.9 ]; then
		pkg_add python-2.7.11
	elif [ $uname_r = 5.8 ]; then
		pkg_add python-2.7.10
	elif [ $uname_r = 5.7 ]; then
		pkg_add python-2.7.9
	elif [ $uname_r = 5.6 ]; then
		pkg_add python-2.7.8
	elif [ $uname_r = 5.5 ]; then
		pkg_add python-2.7.6p0
	elif [ $uname_r = 5.4 ]; then
		pkg_add python-2.7.5
	else
		echo "Did not recognise OpenBSD version."
		exit 1
	fi
else
	echo "Building a box without Python 2 (Ansible)"
fi
