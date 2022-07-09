#!bin/sh
clear=$1
file=$(find d/ -name headset_status)
headset_status=($(cat $file))

function plug_in_detect() {
	plug_in=${headset_status[0]}
	local in=${plug_in:0-2:1}
	if [ $in -gt 0 ]; then
		plug_in_status=1
	else
		plug_in_status=0
	fi
}

function pull_out_detect() {
	pull_out=${headset_status[4]}
	local out=${pull_out:0-2:1}
	if [ $out -gt 0 ]; then
		pull_out_status=1
	else
		pull_out_status=0
	fi
}

function key_media_detect() {
	key_media=${headset_status[3]}
	local down=${key_media:0-1:1}
	local up=${key_media:0-2:1}
	if [ $down -gt 0 -a $down -eq $up ]; then
		key_media_status=1
	else
		key_media_status=0
	fi
}

function key_up_detect() {
	key_up=${headset_status[1]}
	local down=${key_up:0-1:1}
	local up=${key_up:0-2:1}
	if [ $down -gt 0 -a $down -eq $up ]; then
		key_up_status=1
	else
		key_up_status=0
	fi
}

function key_down_detect() {
	key_down=${headset_status[2]}
	local down=${key_down:0-1:1}
	local up=${key_down:0-2:1}
	if [ $down -gt 0 -a $down -eq $up ]; then
		key_down_status=1
	else
		key_down_status=0
	fi
}

if [ ! -n "$clear" ]; then
	#detect headset status
	plug_in_detect
	key_up_detect
	key_down_detect
	key_media_detect
	pull_out_detect
	#show result
	res=($plug_in_status $key_up_status $key_down_status $key_media_status $pull_out_status)
	echo "${res[*]}"
	echo "${headset_status[*]}"
else
	if [ "$clear" = -c ]; then
		echo 0 > $file
	fi
fi
