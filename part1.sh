#!/bin/sh

mkfs.fat -F32 /dev/nvme0n1p1
mkfs.ext4 -F /dev/nvme0n1p2
mkfs.ext4 -F /dev/nvme0n1p3
mount /dev/nvme0n1p2 /mnt
mkdir -p /mnt/boot/efi /mnt/home
mount /dev/nvme0n1p1 /mnt/boot/efi
mount /dev/nvme0n1p3 /mnt/home
pacstrap /mnt base linux linux-firmware
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt
