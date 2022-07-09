#!/vendor/bin/sh

## This is a shell script for executing taskset commands at early-init step
## Do NOT add other commands in this file otherwise you may violate its SELinux policy

taskset -ap 0f `pidof -x kswapd0`
