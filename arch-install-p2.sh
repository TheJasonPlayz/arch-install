#!/bin/bash
mkfs.ext4 "$0"
mkswap "$2"

mount "$0" /mnt

source ./arch-install-windows.sh

swapon "$2"

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