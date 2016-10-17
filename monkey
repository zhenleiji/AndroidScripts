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

FOLDER=MonkeyLog
MONKEY_LOG=monkey.txt
LOGCAT_LOG=logcat.txt
MONKEY_PATH=$HOME/$FOLDER/
ROUND=1

if [ ! -d "$MONKEY_PATH" ]
then
    mkdir MONKEY_PATH
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
            RAND=$4
        else
            RAND=$RANDOM
        fi
        OUTPUT_PATH=$(date +"$MONKEY_PATH%d_%m_%Y_%T_$RAND/")
        mkdir $OUTPUT_PATH
        adb shell monkey -p $1 --hprof --pct-touch 30 --pct-motion 30 --pct-trackball 0 --pct-nav 0 --pct-majornav 20 --pct-appswitch 10 --pct-anyevent 10 --pct-syskeys 0 -s $RAND -v --throttle 300 $NUMBER_OF_EVENTS > $OUTPUT_PATH$MONKEY_LOG
        adb logcat -d > $OUTPUT_PATH$LOGCAT_LOG
    fi

    echo Monkey finished: $(date +"%d/%m/%Y %T") >> $OUTPUT_PATH$MONKEY_LOG
    echo Monkey finished...
    echo
done
