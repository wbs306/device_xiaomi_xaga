# $1: audio source
#     main-mic: main mic
#     top-mic: top mic
#     back-mic: back mic
#     front-mic: front mic
#     us: ultrasound
# $2: sample rate(Hz)
# $3: sample bit
# $4: channel number
# $5: capture duration(s)
# tinycap file.wav [-D card] [-d device] [-c channels] [-r rate] [-b bits] [-p period_size] [-n n_periods] [-t duration]
# sample usage: capture.sh main-mic 48000 16 2 1.5
# sample usage: capture.sh top-mic 48000 16 2 1.5

rate=KHZ_48
filename=/sdcard/unknown_mic.wav

case "$2" in
    "48000" )
        rate=KHZ_48
        ;;
    "96000" )
        rate=KHZ_96
        ;;
    "192000" )
        rate=KHZ_192
        ;;
esac

function enable_main_mic
{
    echo "enabling main mic"
    tinymix 'UL1_CH1 ADDA_UL_CH1' 1
    tinymix 'UL1_CH2 ADDA_UL_CH2' 1

    tinymix 'PGA1 Volume' 2
    tinymix 'PGA2 Volume' 2
    tinymix "MISO0_MUX" "UL1_CH1"
    tinymix "MISO1_MUX" "UL1_CH1" 
    tinymix "ADC_L_Mux" "Left Preamplifier" 
    tinymix "PGA_L_Mux" "AIN0"
    tinymix "DMIC0_MUX" "DMIC_DATA0"
    tinymix "DMIC1_MUX" "DMIC_DATA0"
}

function disable_main_mic
{
    echo "disabling main mic"
    tinymix 'UL1_CH1 ADDA_UL_CH1' 0
    tinymix 'UL1_CH2 ADDA_UL_CH2' 0

    tinymix 'PGA1 Volume' 0
    tinymix 'PGA2 Volume' 0
    tinymix 'MISO1_MUX' 'UL1_CH2'
    tinymix 'ADC_L_Mux' 'Idle'
    tinymix 'PGA_L_Mux' 'None'
    tinymix 'UL_SRC_MUX' 'AMIC'
    tinymix 'UL2_SRC_MUX' 'AMIC'
}

function enable_top_mic
{
    echo "enabling top mic"
    tinymix 'UL1_CH1 ADDA_UL_CH1' 1
    tinymix 'UL1_CH2 ADDA_UL_CH2' 1

    tinymix 'PGA1 Volume' 2
    tinymix 'PGA2 Volume' 2
    tinymix "MISO0_MUX" "UL1_CH2"
    tinymix "MISO1_MUX" "UL1_CH2" 
    tinymix "ADC_R_Mux" "Right Preamplifier" 
    tinymix "PGA_R_Mux" "AIN2"
    tinymix "DMIC0_MUX" "DMIC_DATA2"
    tinymix "DMIC1_MUX" "DMIC_DATA2"
}

function disable_top_mic
{
    echo "disabling top mic"
    tinymix 'UL1_CH1 ADDA_UL_CH1' 0
    tinymix 'UL1_CH2 ADDA_UL_CH2' 0

    tinymix 'PGA1 Volume' 0
    tinymix 'PGA2 Volume' 0
    tinymix 'MISO1_MUX' 'UL1_CH1'
    tinymix 'ADC_R_Mux' 'Idle'
    tinymix 'PGA_R_Mux' 'None'
    tinymix 'UL_SRC_MUX' 'AMIC'
    tinymix 'UL2_SRC_MUX' 'AMIC'
}

function enable_back_mic
{
    echo "enabling back mic"
    tinymix 'Mic_Type_Mux_2' 'DCC'
    tinymix 'UL1_CH1 ADDA_UL_CH1' 1
    tinymix 'UL1_CH2 ADDA_UL_CH2' 1
    tinymix 'MISO0_MUX' 'UL1_CH2'
    tinymix 'MISO1_MUX' 'UL1_CH2'
    tinymix 'ADC_R_Mux' 'Right Preamplifier'
    tinymix 'PGA_R_Mux' 'AIN3'
}

function disable_back_mic
{
    echo "disabling back mic"
    tinymix 'Mic_Type_Mux_2' 'Idle'
    tinymix 'UL1_CH1 ADDA_UL_CH1' 0
    tinymix 'UL1_CH2 ADDA_UL_CH2' 0
    tinymix 'ADC_L_Mux' 'Idle'
    tinymix 'ADC_R_Mux' 'Idle'
    tinymix 'PGA_L_Mux' 'None'
    tinymix 'PGA_R_Mux' 'None'
}

function enable_front_mic
{
    echo "PHONE HAS NO FRONT MIC!"
}

function disable_front_mic
{
    echo "PHONE HAS NO FRONT MIC!"
}

function enable_ultrasound_mic
{
    echo "enable ultrasound mic"
    tinymix 'Mic_Type_Mux_2' 'DCC'
    tinymix 'UL5_CH1 ADDA_UL_CH1' 1
    tinymix 'UL5_CH2 ADDA_UL_CH2' 1
    tinymix 'MISO0_MUX' 'UL1_CH2'
    tinymix 'MISO1_MUX' 'UL1_CH2'
    tinymix 'ADC_R_Mux' 'Right Preamplifier'
    tinymix 'PGA_R_Mux' 'AIN2'
}

function disable_ultrasound_mic
{
    echo "disable ultrasound mic"
    tinymix 'Mic_Type_Mux_2' 'Idle'
    tinymix 'UL5_CH1 ADDA_UL_CH1' 0
    tinymix 'UL5_CH2 ADDA_UL_CH2' 0
    tinymix 'ADC_L_Mux' 'Idle'
    tinymix 'ADC_R_Mux' 'Idle'
    tinymix 'PGA_L_Mux' 'None'
    tinymix 'PGA_R_Mux' 'None'
}

case "$1" in
    "main-mic" )
        enable_main_mic
        filename=/sdcard/main_mic.wav
        pcm_id=10
        ;;
    "top-mic" )
        enable_top_mic
        filename=/sdcard/top_mic.wav
        pcm_id=10
        ;;
    "back-mic" )
        enable_back_mic
        filename=/sdcard/back_mic.wav
        pcm_id=10
        ;;
    "front-mic" )
        enable_front_mic
        filename=/sdcard/front_mic.wav
        pcm_id=10
        ;;
    "us" )
        enable_ultrasound_mic
        filename=/sdcard/us_mic.wav
        pcm_id=14
        ;;
    *)
        echo "Usage: capture.sh main-mic 48000 16 2 10"
        ;;
esac

if [ -z "$6" ]; then
    period_size=1024
else
    period_size=$6
fi

if [ -z "$7" ]; then
    n_periods=4
else
    n_periods=$7
fi


# start recording
echo "start recording"
tinycap $filename -D 0 -d $pcm_id -r $2 -b $3 -c $4 -T $5 -p $period_size -n $n_periods
ret=$?
if [ $ret -ne 0 ]; then
    echo "tinycap done, return $ret"
fi

# tear down
case "$1" in
    "main-mic" )
        disable_main_mic
        ;;
    "top-mic" )
        disable_top_mic
        ;;
    "back-mic" )
        disable_back_mic
        ;;
    "front-mic" )
        disable_front_mic
        ;;
    "us" )
        disable_ultrasound_mic
        ;;
esac
