#!/bin/bash


# optional arg sceneID for spinserver/spinviewer
OS=`uname -s`




DIR_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo DIRPATH= $DIR_PATH


PD_PATCHES="mobilizer.pd"


#PD_PATCHES="windchimes2.pd"
AUDIO_RENDERER_PATCHES="wcAudioRenderer.pd"


export OSG_NOTIFY_LEVEL=FATAL



#OVERWRITE AUTOMATICALLY GENERATED PATH DUE TO USER NAME DIFFERENCES
DIR_PATH=~/src/bonejam/scripts

PATCHES_PATH="$DIR_PATH/../patches"
EXTERNS_DIR="$DIR_PATH/../src/strang"
SOUND_PATH="$DIR_PATH/../sound"



if [ -z $1 ] ; then
echo using default scene ID
sh $LAUNCHSPIN_SCRIPT
else
echo using --scene-id $1
sh $LAUNCHSPIN_SCRIPT $1
fi



if [ "$OS" = "Darwin" ]; then


#PDSHEEFA_DIR=$HOME/Library/Pd/pdsheefa
PDSHEEFA_DIR="~/Library/Pd/pdsheefa"

PD=/Applications/Pd-extended.app/Contents/Resources/bin/pd

PDEXEC="Pd-extended"


echo using $PD


else  #linux

PDSHEEFA_DIR=/usr/local/lib/pd-externals/pdsheefa

PD=pdextended
PDEXEC="pdextended"

echo using $PD
fi



#make extern(s)

#echo "\n making extern(s) in $EXTERNS_DIR"
#    cd $EXTERNS_DIR
#    make



#  add audio and any other pd command line flags here
PDFLAGS=" $PD_AUDIO_FLAGS -path $PDSHEEFA_DIR:$PATCHES_PATH:$SOUND_PATH:$EXTERNS_DIR"



cd $PATCHES_PATH



killall $PDEXEC


PD_PROCESS_IP=localhost
PDMESS="dsp start"



if [ $PD_PROCESS_IP = localhost ] || [ $PD_PROCESS_IP = $MY_IP ] ; then

    killall $PDEXEC
#   launch Audio process on Localhost
    echo "calculating audio on localhost: $PD $PDFLAGS $PD_PATCHES" &
    $PD  $PDFLAGS $PD_PATCHES &
else
    #   launch Audio process on remote host
    echo "calculating audio on remote host $PD_PROCESS_IP:  $PD $PDFLAGS $PD_PATCHES" &
    #
    ssh $PD_PROCESS_IP "killall $PDEXEC"
    #    ssh metalab "$LOCATION $PD $PDFLAGS $AUDIO_RENDERER_PATCHES" &
    ssh $PD_PROCESS_IP "$PD  $PDFLAGS $PD_PATCHES " &
fi



# launch BONEJAM patches on localhost

if [ -z $PDMESS ] ; then

echo "\n launching BONEJAM patches on localhost: \n $PD  $PDFLAGS $PD_PATCHES"

$PD  $PDFLAGS $PD_PATCHES &
else

$PD -send "$PDMESS" $PDFLAGS $PD_PATCHES &

fi









