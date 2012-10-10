#!/bin/sh
# chkconfig: - 58 74

export PATH=$PATH:/sbin:/usr/sbin

case "$1" in
  start)
	/etc/cron.scripts/cpu-performance-scaling.sh
	/etc/cron.scripts/hdd-deadline-scheduler.sh
	/etc/cron.scripts/network-queues.sh
  ;;
esac


