#!/bin/bash

loadkeys pl
timedatectl set-ntp true

# disk setup
parted /dev/sda mktable gpt
# efi
parted /dev/sda mkpart "EFI" fat32 1MiB 1025MiB
parted /dev/sda set 1 esp on
# swap
parted /dev/sda mkpart "swap" linux-swap 1025MiB 5121MiB
# root
parted /dev/sda mkpart "root" ext4 5121MiB 100%
# format
mkfs.vfat -F32 /dev/sda1
mkswap /dev/sda2
mkfs.ext4 /dev/sda3
# mount
mount /dev/sda3 /mnt
mkdir -p /mnt/boot
mount /dev/sda1 /mnt/boot
swapon /dev/sda2

pacstrap /mnt base linux linux-firmware
genfstab -U /mnt >> /mnt/etc/fstab

