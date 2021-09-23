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
options cryptdevice=UUID=$(blkid -s UUID -o value /dev/nvme0n1p2):luks root=/dev/mapper/luks rw
EOF
