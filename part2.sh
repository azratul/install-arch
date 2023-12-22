#!/bin/sh

ln -sf /usr/share/zoneinfo/America/Santiago /etc/localtime
hwclock --systohc
pacman -S vim netctl iw dhcpcd sudo neofetch udisks2 mtpfs gvfs-mtp gvfs-gphoto2 git openssh base-devel jq nmap nbtscan ettercap tcpdump jp2a imagemagick sxiv nitrogen groff zathura zathura-pdf-mupdf zathura-ps zathura-cb zathura-djvu dialog bash-completion lsd wpa_supplicant sddm neofetch amd-ucode efibootmgr grub kitty nvidia-dkms nvidia-utils hyprland qt5-wayland qt5ct libva wlroots seatd linux linux-headers
sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT="\(.*\)"/GRUB_CMDLINE_LINUX_DEFAULT="\1 clocksource=hpet nvidia_drm.modeset=1"/' /etc/default/grub
sed -i 's/MODULES=()/MODULES=(nvidia nvidia_modeset nvidia_uvm nvidia_drm)/' /etc/mkinitcpio.conf
echo 'options nvidia-drm modeset=1' >> /etc/modprobe.d/nvidia.conf
mkinitcpio --config /etc/mkinitcpio.conf --generate /boot/initramfs-custom.img
sed -i 's/#es_CL.UTF-8/es_CL.UTF-8/g' /etc/locale.gen
locale-gen
echo 'LANG=es_CL.UTF-8' > /etc/locale.conf
echo 'magi-system' > /etc/hostname
echo -e '127.0.0.1 localhost magi-system.localdomain magi-system\n::1       localhost magi-system.localdomain magi-system' > /etc/hosts
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id="Arch Linux"
grub-mkconfig -o /boot/grub/grub.cfg
systemctl enable sddm
useradd -m -g users -G wheel -s /bin/bash clepin
echo "Password Clepin"
passwd clepin
echo "Password root"
passwd
EDITOR=vim visudo
#su - clepin
