#!/vendor/bin/sh

function configure_memory_parameters() {
	# Set Memory parameters.

	MemTotalStr=`cat /proc/meminfo | grep MemTotal`
	MemTotal=${MemTotalStr:16:8}

	if [ $MemTotal -gt 6000000 ]; then
		echo 5  > /proc/sys/vm/watermark_boost_factor
	else
		echo 10 > /proc/sys/vm/watermark_boost_factor
	fi
}

configure_memory_parameters
