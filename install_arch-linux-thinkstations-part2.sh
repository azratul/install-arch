#!/bin/sh

#mount /dev/sda2 /mnt
#mount /dev/sda1 /mnt/boot/efi
#mount /dev/sda4 /mnt/home

vim /etc/pacman.d/mirrorlist
pacstrap /mnt base linux linux-firmware
genfstab -U /mnt >> /mnt/etc/fstab
cat /mnt/etc/fstab
#arch-chroot /mnt
