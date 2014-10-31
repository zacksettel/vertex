#!/bin/bash

DIR_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo DIRPATH= $DIR_PATH

source $DIR_PATH/pdDefs.sh


exit

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









