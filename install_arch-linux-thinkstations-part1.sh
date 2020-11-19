#!/bin/sh

dhcpcd enp0s29u1u3
mkfs.fat -F32 /dev/sda1
mkfs.ext4 /dev/sda2
mkfs.ext4 /dev/sda3
mkfs.ext4 /dev/sda4
mkdir -p /mnt/boot/efi /mnt/home
mount /dev/sda2 /mnt
mount /dev/sda1 /mnt/boot/efi
mount /dev/sda4 /mnt/home
vim /etc/pacman.d/mirrorlist
pacstrap /mnt base linux linux-firmware
genfstab -U /mnt >> /mnt/etc/fstab
cat /mnt/etc/fstab
arch-chroot /mnt
