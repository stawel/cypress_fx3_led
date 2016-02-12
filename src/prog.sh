#!/bin/bash

set -x

TARGET=$FX3_INSTALL_PATH/JTAG/OpenOCD/Config/arm926ejs_fx3.cfg
OPENOCD=$FX3_INSTALL_PATH/JTAG/OpenOCD/Linux/x64/openocd
ELF=led


echo "ELF=$ELF"

$OPENOCD -f $TARGET #-c "load_image $ELF"
