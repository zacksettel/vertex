#!/bin/bash
# include this for pd scripts

OS=`uname -s`



# this file should be ~/src/vertex/scripts

export DIR_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo DIRPATH= $DIR_PATH


#PD_PATCHES="test.pd"


BOXDIR=~/boxSync

export PATCHES_PATH="$DIR_PATH/../puredata/patches:$BOXDIR/puredata/patches"
export EXTERNS_DIR="$DIR_PATH/../puredata/src/strang:$BOXDIR/puredata/src/strang"
export SOUND_PATH="$DIR_PATH/../sound:$BOXDIR/sound"

export PDMESSAGE="pd dsp 1"


if [ "$OS" = "Darwin" ]; then


    export PD_AUDIO_FLAGS=" -r 44100 -blocksize 1024"

    ex[prt PDSHEEFA_DIR="~/Library/Pd/pdsheefa"

    PD=/Applications/Pd-extended.app/Contents/Resources/bin/pd

    export PDEXEC="Pd-extended"

    echo using $PD


else  #linux

    export PD_AUDIO_FLAGS=" -r 44100 -blocksize 1024 -nogui"

    export PDSHEEFA_DIR=/usr/local/lib/pd-externals/pdsheefa

    PD=pdextended
    export PDEXEC="pdextended"

    echo using $PD
fi
