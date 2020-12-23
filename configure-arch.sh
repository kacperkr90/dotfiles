#!/bin/bash

ln -sf /usr/share/zoneinfo/Poland /etc/localtime
hwclock --systohc
sed -i 's/#pl_PL.UTF-8/pl_PL.UTF-8/' /etc/locale.gen
locale-gen
echo 'LANG=pl_PL.UTF-8' > /etc/locale.conf
echo 'KEYMAP=pl' > /etc/vconsole.conf
echo 'kacper@arch' > /etc/hostname

echo '127.0.0.1 localhost' >> /etc/hosts
echo '::1		localhost' >> /etc/hosts
echo '127.0.1.1	kacper@arch.localdomain	kacper@arch' >> /etc/hosts

mkinitcpio -P

passwd

# bootloader
chmod u+x systemd-boot.sh
bash systemd-boot.sh