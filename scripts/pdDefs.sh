#!/bin/bash
# include this for pd scripts

OS=`uname -s`



# this file should be ~/src/vertex/scripts

DIR_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo DIRPATH= $DIR_PATH


#PD_PATCHES="test.pd"


BOXDIR=~/boxSync

PATCHES_PATH="$DIR_PATH/../puredata/patches:$BOXDIR/puredata/patches"
EXTERNS_DIR="$DIR_PATH/../puredata/src/strang:$BOXDIR/puredata/src/strang"
SOUND_PATH="$DIR_PATH/../sound:$BOXDIR/sound"

PDMESSAGE="pd dsp 1"


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
