#!/bin/bash


# optional arg sceneID for spinserver/spinviewer
OS=`uname -s`




DIR_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
#echo DIRPATH= $DIR_PATH



if [ "$OS" = "Darwin" ]; then

PDEXEC=pd


else  #linux

PDEXEC=pdextended


fi


PI_IP=pi

if [ $PI_IP = localhost ] || [ $PI_IP = $MY_IP ] ; then

    sh killall "pd" "pdextended" &
else
    #   launch Audio process on remote host
    echo ssh $PI_IP: killall "pd" "pdextended"
    #
    ssh $PI_IP killall "pd" "pdextended" &
fi










