#!/bin/sh

if [ `whoami` != 'root' ] ; then
        echo "this script runs only under root account"
        exit 1
fi

if [ -f /etc/init.d/cpuspeed ] ; then
	/etc/init.d/cpuspeed start
else
	echo "no cpuspeed found"
	exit 1	
fi

modprobe cpufreq_powersave 
if [ $? -ne 0 ] ; then
	echo "Failed to load cpufreq_powersave"
	exit 0
fi

modprobe cpufreq_ondemand
if [ $? -ne 0 ] ; then
        echo "Failed to load cpufreq_ondemand"
        exit 0
fi
modprobe acpi-cpufreq
if [ $? -ne 0 ] ; then
        echo "Failed to load acpi-cpufreq. You should enable speedstep aka EIST and turbo-boost in BIOS to gain any profit from the CPU related tuning"
        exit 0
fi

if [ ! -d /sys/devices/system/cpu/cpu0/cpufreq ] ; then
	echo "Could not access /sys/devices/system/cpu/cpu0/cpufreq - something has gone wrong"
	exit 0
fi

MAXCPU=$[`fgrep -c processor /proc/cpuinfo` - 1]
for i in `seq 0 $MAXCPU` ; do
	echo performance > "/sys/devices/system/cpu/cpu${i}/cpufreq/scaling_governor"
done

#for i in `seq 0 31` ; do echo performance > /sys/devices/system/cpu/cpu${i}/cpufreq/scaling_governor ; done

