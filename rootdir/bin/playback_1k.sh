set -x
# $1: device for output
#     top: top speaker
#     bot: bottom speaker
#     spk: top speaker and bottom speaker

# $2: mode to select wav played
#     low: 1k_0.01.wav
#     high: 1k_0.8.wav

# tinyplay 1k_0.*.wav [-D card] [-d device] [-p period_size] [-n n_periods]
# sample usage: playback_1k.sh spk low

function enable_speaker
{
    tinymix 'I2S3_CH1 DL1_CH1' 1
    tinymix 'I2S3_CH2 DL1_CH2' 1

    tinymix 'I2S3_HD_Mux' 'Low_Jitter'

    if [ "$dev" = "top" ]; then
        echo "enabling top speaker"
        tinymix 'Left TFA Profile' 'left'
    elif [ "$dev" = "bot" ]; then
        echo "enabling bottom speaker"
        tinymix 'Left TFA Profile' 'right'
    elif [ "$dev" = "spk" ]; then
        echo "enabling top speaker and bottom speaker"
        tinymix 'Left TFA Profile' 'stereo'
    else
        echo "Usage: playback_1k.sh <dev> <mode>"
        echo "    <dev>  {top, bot, spk}"
        echo "    <mode> {low, high}"
        exit 0
    fi

    sleep 1
}

function disable_speaker
{
    echo "disabling top speaker and bottom speaker"

    tinymix 'I2S3_CH1 DL1_CH1' 0
    tinymix 'I2S3_CH2 DL1_CH2' 0

    tinymix 'I2S3_HD_Mux' 'Normal'

    tinymix 'Left TFA Profile' 'stereo'
}

dev=$1

enable_speaker

if [ "$2" = "low" ]; then
    filename=/vendor/etc/1k_0.01.wav
elif [ "$2" = "high" ]; then
    filename=/vendor/etc/1k_0.8.wav
else
    echo "Usage: playback_1k.sh <dev> <mode>"
    echo "    <dev>  {top, bot, spk}"
    echo "    <mode> {low, high}"
    exit 0
fi

echo "start playing 1k wav"
nohup tinyplay $filename -D 0 -d 0

disable_speaker

exit 0
