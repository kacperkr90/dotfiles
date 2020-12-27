#!/bin/bash

bootctl install 

cat > /boot/loader/loader.conf<< EOF
default arch.conf
timeout 2
console-mode max
editor no
EOF

cat > /boot/loader/entries/arch.conf<< EOF
title Arch Linux
linux /vmlinuz-linux
initrd /intel-ucode.img
initrd /initramfs-linux.img
options cryptdevice=PARTUUID=$(blkid -s PARTUUID -o value /dev/sda2):luks root=/dev/mapper/luks rw
EOF