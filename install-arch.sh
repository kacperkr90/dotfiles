#!/bin/bash

loadkeys pl
timedatectl set-ntp true

# disk setup
parted /dev/nvme0n1 mktable gpt
# efi
parted /dev/nvme0n1 mkpart "EFI" fat32 1MiB 1025MiB
parted /dev/nvme0n1 set 1 esp on
# root
parted /dev/nvme0n1 mkpart "root" ext4 1025MiB 100%
# encrypt
cryptsetup luksFormat /dev/nvme0n1p2
cryptsetup luksOpen /dev/nvme0n1p2 luks
# format
mkfs.vfat -F32 /dev/nvme0n1p1
mkfs.ext4 /dev/mapper/luks
# mount
mount /dev/mapper/luks /mnt
mkdir -p /mnt/boot
mount /dev/nvme0n1p1 /mnt/boot

pacstrap /mnt base base-devel linux linux-firmware intel-ucode nano
genfstab -U /mnt >> /mnt/etc/fstab
