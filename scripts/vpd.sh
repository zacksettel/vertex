#!/bin/bash


# optional arg sceneID for spinserver/spinviewer
OS=`uname -s`



# this should be ~/src/vertex/scripts

DIR_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo DIRPATH= $DIR_PATH


#PD_PATCHES="test.pd"


BOXDIR=~/boxSync

PATCHES_PATH="$DIR_PATH/../puredata/patches:$BOXDIR/puredata/patches"
EXTERNS_DIR="$DIR_PATH/../puredata/src/strang:$BOXDIR/puredata/src/strang"
SOUND_PATH="$DIR_PATH/../sound:$BOXDIR/sound"


if [ "$OS" = "Darwin" ]; then


    #PD_AUDIO_FLAGS=" -r 44100 -blocksize 1024"

    PDSHEEFA_DIR="~/Library/Pd/pdsheefa"

    PD=/Applications/Pd-extended.app/Contents/Resources/bin/pd

    PDEXEC="Pd-extended"

    echo using $PD

    PDMESSAGE="pd dsp 1"

else  #linux

    PD_AUDIO_FLAGS=" -r 44100 -blocksize 1024 -nogui"

    PDSHEEFA_DIR=/usr/local/lib/pd-externals/pdsheefa

    PD=pdextended
    PDEXEC="pdextended"

    echo using $PD
fi


#  add audio and any other pd command line flags here
PDFLAGS=" $PD_AUDIO_FLAGS -path $PDSHEEFA_DIR:$PATCHES_PATH:$SOUND_PATH:$EXTERNS_DIR"


killall $PDEXEC



if [ -z "$PDMESSAGE" ] ; then

    echo "\n launching vpd on localhost: \n $PD  $PDFLAGS $PD_PATCHES"

    $PD  $PDFLAGS  $1 $2 $3 $4 $5 &
    #$PD  $PDFLAGS $PD_PATCHES &
else

    echo "\n launching vpd on localhost: \n $PD  -send $PDMESSAGE $PDFLAGS $PD_PATCHES"

    $PD -send "$PDMESSAGE" $PDFLAGS $PD_PATCHES $1 $2 $3 $4 $5 &

fi









