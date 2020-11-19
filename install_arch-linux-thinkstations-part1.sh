#!/bin/sh

mkdir -p /mnt/boot/efi /mnt/home
mkfs.fat -F32 /dev/sda1
mkfs.ext4 -F /dev/sda2
mkfs.ext4 -F /dev/sda3
mkfs.ext4 -F /dev/sda4
