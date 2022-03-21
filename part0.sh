#!/bin/sh

umount root boot
rm -rf boot root
mkdir boot root
mkfs.vfat /dev/sdc1
mount /dev/sdc1 boot
mkfs.ext4 /dev/sdc2
mount /dev/sdc2 root
bsdtar -xpf ArchLinuxARM-rpi-aarch64-latest.tar.gz -C root
sync
sed -i 's/mmcblk0/mmcblk1/g' root/etc/fstab
mv root/boot/* boot
# START ONLY FOR RPI-400
sed -i 's/{fdt_addr_r};/{fdt_addr};/g' boot/boot.txt
pacman -S uboot-tools
mkimage -A arm -T script -O linux -d boot/boot.txt boot/boot.scr
# END - ONLY FOR RPI-400
umount root boot

