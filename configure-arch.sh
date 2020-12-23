#!/bin/bash

ln -sf /usr/share/zoneinfo/Poland /etc/localtime
hwclock --systohc
sed -i 's/#en_US.UTF-8/en_US.UTF-8/' /etc/locale.gen
locale-gen
echo 'LANG=pl_PL.UTF-8' > /etc/locale.conf
echo 'KEYMAP=pl' > /etc/vconsole.conf
echo 'arch' > /etc/hostname

echo '127.0.0.1 localhost' >> /etc/hosts
echo '::1		localhost' >> /etc/hosts
echo '127.0.1.1	arch.localdomain arch' >> /etc/hosts

mkinitcpio -P

passwd

useradd -m kacper
passwd kacper

# bootloader
chmod u+x systemd-boot.sh
bash systemd-boot.sh

pacman -Sy
pacman -S git networkmanager