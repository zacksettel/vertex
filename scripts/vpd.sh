#!/bin/bash

DIR_PATH=/home/pi/src/vertex/scripts
echo DIRPATH= $DIR_PATH

#!/bin/bash
# include this for pd scripts

OS=`uname -s`

# this file should be ~/src/vertex/scripts




#PD_PATCHES="test.pd"


BOXDIR=~/boxSync

 PATCHES_PATH="$DIR_PATH/../puredata/patches:$BOXDIR/puredata/patches"
 EXTERNS_DIR="$DIR_PATH/../puredata/src/strang:$BOXDIR/puredata/src/strang"
 SOUND_PATH="$DIR_PATH/../sound:$BOXDIR/sound"

 PDMESSAGE="pd dsp 1"


if [ "$OS" = "Darwin" ]; then


    PD_AUDIO_FLAGS=" -r 44100 -blocksize 1024"

    PDSHEEFA_DIR="~/Library/Pd/pdsheefa"

    PD=/Applications/Pd-extended.app/Contents/Resources/bin/pd

    PDEXEC="Pd-extended"

    echo using $PD


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

    echo "\n launching vpd on localhost: \n $PD  $PDFLAGS $PD_PATCHES $1 $2 $3 $4 $5"

    $PD  $PDFLAGS  $1 $2 $3 $4 $5 &
    #$PD  $PDFLAGS $PD_PATCHES &
else

    echo "\n launching vpd on localhost: \n $PD  -send $PDMESSAGE $PDFLAGS $PD_PATCHES $1 $2 $3 $4 $5"

    $PD -send "$PDMESSAGE" $PDFLAGS $PD_PATCHES $1 $2 $3 $4 $5 &

fi









