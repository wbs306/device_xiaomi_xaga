function enable_xiaoai
{
    echo "enabling xiaoai"
    sleep 1
	settings put system voice_wakeup_active_command_id 0
	sleep 1
	settings put system VOICE_WAKEUP_COMMAND_STATUS_1ENK 2,2
	sleep 0.5
	settings put system voice_wakeup_command_ui_action_1enk 2,2
	sleep 0.5
	am broadcast -a com.mediatek.vow.ACTION_SWITCH_USER
	sleep 0.5
}

function disable_xiaoai
{
    echo "disabling xiaoai"
	sleep 0.5
	settings put system voice_wakeup_active_command_id 0
	sleep 0.5
	settings put system VOICE_WAKEUP_COMMAND_STATUS_1ENK 1,1
	sleep 0.5
	settings put system voice_wakeup_command_ui_action_1enk 0,0
	sleep 0.5
	am broadcast -a com.mediatek.vow.ACTION_SWITCH_USER
	sleep 0.5
}
case "$1" in
    "0" )
        disable_xiaoai
        ;;
    "1" )
        enable_xiaoai
        ;;
esac

