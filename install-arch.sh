#!/bin/bash

loadkeys pl
timedatectl set-ntp true

# disk setup
parted /dev/sda mktable gpt
# efi
parted /dev/sda mkpart "EFI" fat32 1MiB 1025MiB
parted /dev/sda set 1 esp on
# root
parted /dev/sda mkpart "root" ext4 1025MiB 100%
# encrypt
cryptsetup luksFormat /dev/sda2
cryptsetup luksOpen /dev/sda2 luks
# format
mkfs.vfat -F32 /dev/sda1
mkfs.ext4 /dev/mapper/luks
# mount
mount /dev/mapper/luks /mnt
mkdir -p /mnt/boot
mount /dev/sda1 /mnt/boot

pacstrap /mnt base base-devel linux linux-firmware intel-ucode nano
genfstab -U /mnt >> /mnt/etc/fstab
