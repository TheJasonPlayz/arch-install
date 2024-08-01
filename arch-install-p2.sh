#!/bin/bash

mapfile ARGS < ./arch-install-disks.txt
mkfs.ext4 "${ARGS[0]}"
mkswap "${ARGS[1]}"

mount "${ARGS[0]}" /mnt

source ./arch-install-windows.sh

swapon "${ARGS[1]}"

pacstrap -K /mnt base linux linux-firwmare networkmanager dhcpcd network-manager-applet nano man-db man-pages texinfo

genfstab -U /mnt >> /mnt/etc/fstab

arch-chroot /mnt

ln -sf /usr/share/zoneinfo/America/Denver /etc/localtime
hwclock --systohc

locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
echo "JASONS_COMPUTER_ARCH" >> /etc/hostname
mkinitcpio -P

passwd

source ./arch-install-grub.sh
