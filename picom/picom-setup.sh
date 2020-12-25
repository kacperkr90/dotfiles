#!/bin/bash

PICOM_CONFIG_DIR=$HOME/.config/picom

mkdir -p $PICOM_CONFIG_DIR

cp /etc/xdg/picom.conf $PICOM_CONFIG_DIR/

PICOM_CONF_FILE=$PICOM_CONFIG_DIR/picom.conf

# disable vsync
sed -i 's/vsync = true/# vsync = true/' $PICOM_CONF_FILE
sed -i 's/# vsync = false/vsync = false/' $PICOM_CONF_FILE