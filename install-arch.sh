#!/bin/bash

loadkeys pl
timedatectl set-ntp true

# disk setup
parted /dev/sda mktable gpt
parted /dev/sdb mktable gpt
parted /dev/sdc mktable gpt
# efi
parted /dev/sda mkpart "EFI" fat32 1MiB 1025MiB
parted /dev/sda set 1 esp on
# root
parted /dev/sda mkpart "root" ext4 1025MiB 100%
parted /dev/sdb mkpart "hdd" ext4 1MiB 100%
parted /dev/sdc mkpart "ssd" ext4 1MiB 100%
# encrypt
cryptsetup luksFormat /dev/sda2
cryptsetup luksFormat /dev/sdb1
cryptsetup luksFormat /dev/sdc1
cryptsetup luksOpen /dev/sda2 luks
cryptsetup luksOpen /dev/sdb1 big
cryptsetup luksOpen /dev/sdc1 fast
# format
mkfs.vfat -F32 /dev/sda1
mkfs.ext4 /dev/mapper/luks
mkfs.ext4 /dev/mapper/big
mkfs.ext4 /dev/mapper/fast
# mount
mount /dev/mapper/luks /mnt
mkdir -p /mnt/boot
mkdir -p /mnt/mnt/big
mkdir -p /mnt/mnt/fast
mount /dev/sda1 /mnt/boot
mount /dev/sdb1 /mnt/mnt/big
mount /dev/sdc1 /mnt/mnt/fast

pacstrap /mnt base base-devel linux linux-firmware intel-ucode nano
genfstab -U /mnt >> /mnt/etc/fstab
