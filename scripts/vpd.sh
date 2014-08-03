#!/bin/bash


# optional arg sceneID for spinserver/spinviewer
OS=`uname -s`



# this should be ~/src/vertex/scripts

DIR_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo DIRPATH= $DIR_PATH


#PD_PATCHES="test.pd"


PATCHES_PATH="$DIR_PATH/../puredata/patches"
EXTERNS_DIR="$DIR_PATH/../puredata/src/strang"
SOUND_PATH="$DIR_PATH/../sound"


if [ "$OS" = "Darwin" ]; then


    #PD_AUDIO_FLAGS=" -r 44100 -blocksize 1024"

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



if [ -z $PDMESS ] ; then

    echo "\n launching vpd on localhost: \n $PD  $PDFLAGS $PD_PATCHES"

    $PD  $PDFLAGS  &
    #$PD  $PDFLAGS $PD_PATCHES &
else

    $PD -send "$PDMESS" $PDFLAGS $PD_PATCHES &

fi









