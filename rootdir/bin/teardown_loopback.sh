AudioSetParam SET_LOOPBACK_TYPE=0

sleep 0.3
tinymix 'PGA1 Volume' 0
tinymix 'PGA2 Volume' 0
# tinymix 'Headset_PGAL_GAIN' 0
# tinymix 'Headset_PGAR_GAIN' 0
tinymix 'Headset Volume' 31 31

sleep 0.3
AudioSetParam SET_AURISYS_ON=1
sleep 0.3