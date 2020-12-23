#!/bin/bash

bootctl install

cat > /boot/loader/loader.conf<< EOF
default arch.conf
timeout 4
console-mode max
editor no
EOF

cat > /boot/loader/entries/arch.conf<< EOF
title   Arch Linux
linux   /vmlinuz-linux
initrd  /intel-ucode.img
initrd  /initramfs-linux.img
options root="PARTLABEL=root" rw
EOF