#!/bin/bash


# optional arg sceneID for spinserver/spinviewer
OS=`uname -s`




DIR_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
#echo DIRPATH= $DIR_PATH



#if [ "$OS" = "Darwin" ]; then




#else  #linux


#fi


PI_IP=pi@192.168.0.10

if [ $PI_IP = localhost ] || [ $PI_IP = $MY_IP ] ; then

    sh '~/src/vertex/scripts/vpd.sh' $1 &
else
    #   launch Audio process on remote host
    echo ssh $PI_IP: sh '~/src/vertex/scripts/vpd.sh' $1
    #
    ssh $PI_IP sh '~/src/vertex/scripts/vpd.sh' $1 &
fi










