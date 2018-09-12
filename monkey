#!/bin/bash
# Nome: Zhenlei Ji
# Email: zhenlei.ji@gmail.com
#
# Easy way to run monkey test.
#
# HOW TO USE
# Commands:
# ~$ ./monkey [PACKAGE] [optional: NUMBER_OF_EVENTS (default: 720000)] [optional: ROUND (default: 1)] [optional: SEED]
#
# Example :
# ~$ ./monkey com.itspen.app
# ~$ ./monkey com.itspen.app 5000000 3 345

MONKEY_LOG=monkey.txt
LOGCAT_LOG=logcat.txt
ROUND=1

if [ $# -eq 0 ]
then
    echo "No arguments supplied! How to use:"
    echo "./monkey [PACKAGE] [optional: NUMBER_OF_EVENTS (default: 720000)] [optional: ROUND (default: 1)] [optional: SEED]"
    exit 1
fi

if [ -z "$2" ]
then
    NUMBER_OF_EVENTS=720000
else
    NUMBER_OF_EVENTS=$2
fi

if [ "$3" ] && [ $3 -gt 1 ] 
then
    ROUND=$3
fi

for i in `seq 1 $ROUND`;
do
    echo Teste $i
    echo Monkey is running...

    if [ "$1" ]
    then
        if [ "$4" ]
        then
            SEED=$4
        else
            SEED=$RANDOM
        fi
        OUTPUT_PATH=$(date +"%Y_%m_%d_%H_%M_%S_$SEED/")
        mkdir $OUTPUT_PATH

        echo "Manufacturer: "`adb shell getprop ro.product.manufacturer` > $OUTPUT_PATH$MONKEY_LOG
        echo "Name: "`adb shell getprop ro.product.name` >> $OUTPUT_PATH$MONKEY_LOG
        echo "Model: "`adb shell getprop ro.product.model` >> $OUTPUT_PATH$MONKEY_LOG
        echo "Android Version: "`adb shell getprop ro.build.version.release` >> $OUTPUT_PATH$MONKEY_LOG
        echo "Android SDK: "`adb shell getprop ro.build.version.sdk` >> $OUTPUT_PATH$MONKEY_LOG
        echo ""  >> $OUTPUT_PATH$MONKEY_LOG
        echo "Date: "`adb shell getprop ro.build.date` >> $OUTPUT_PATH$MONKEY_LOG
        echo "Timezone: "`adb shell getprop persist.sys.timezone` >> $OUTPUT_PATH$MONKEY_LOG
        echo "Locale: "`adb shell getprop persist.sys.locale` >> $OUTPUT_PATH$MONKEY_LOG
        echo ""  >> $OUTPUT_PATH$MONKEY_LOG
        echo "-----------------------------------------------" >> $OUTPUT_PATH$MONKEY_LOG
        echo ""  >> $OUTPUT_PATH$MONKEY_LOG

        adb shell monkey -p $1 --hprof --pct-touch 30 --pct-motion 30 --pct-trackball 0 --pct-nav 0 --pct-majornav 20 --pct-appswitch 10 --pct-anyevent 10 --pct-syskeys 0 -s $SEED -v --throttle 300 $NUMBER_OF_EVENTS >> $OUTPUT_PATH$MONKEY_LOG
        adb logcat -d > $OUTPUT_PATH$LOGCAT_LOG
    fi

    echo Monkey finished: $(date +"%d.%m.%Y %T") >> $OUTPUT_PATH$MONKEY_LOG
    echo Monkey finished...
    echo
done
