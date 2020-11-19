#!/bin/sh

mkdir -p /mnt/boot/efi /mnt/home
mkfs.fat -F32 /dev/sda1
mkfs.ext4 -F /dev/sda2
mkfs.ext4 -F /dev/sda3
mkfs.ext4 -F /dev/sda4
mount /dev/sda2 /mnt
mount /dev/sda1 /mnt/boot/efi
mount /dev/sda4 /mnt/home
vim /etc/pacman.d/mirrorlist
pacstrap /mnt base linux linux-firmware
genfstab -U /mnt >> /mnt/etc/fstab
cat /mnt/etc/fstab
arch-chroot /mnt
