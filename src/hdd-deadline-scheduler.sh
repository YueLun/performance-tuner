#!/bin/bash

if [ `whoami` != 'root' ] ; then
	echo "this script runs only under root account"
	exit 1
fi

for disk in `ls -d /sys/block/sd* | grep -v '[[:digit:]]'` ; do
	echo "deadline" > "${disk}/queue/scheduler"
done


