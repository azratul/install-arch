#!/bin/sh

ln -sf /usr/share/zoneinfo/America/Santiago /etc/localtime
hwclock --systohc
pacman -S vim intel-ucode efibootmgr grub netctl iw dhcpcd lightdm lightdm-gtk-greeter xorg-server xorg-xinit xorg-xinput xorg-xhost sudo udisks2 mtpfs gvfs-mtp gvfs-gphoto2 git openssh base-devel jq htop nmap nbtscan ettercap tcpdump jp2a imagemagick xdg-utils sxiv entr nitrogen xclip groff zathura zathura-pdf-mupdf zathura-ps zathura-cb zathura-djvu notify-osd libnotify picom dmenu neofetch bspwm sxhkd alacritty stow xf86-video-nouveau ranger dialog bash-completion pulseaudio pulseaudio-alsa alsa-utils lsd wpa_supplicant
sed -i 's/#es_CL.UTF-8/es_CL.UTF-8/g' /etc/locale.gen
locale-gen
echo 'LANG=es_CL.UTF-8' > /etc/locale.conf
echo 'magi-system' > /etc/hostname
echo -e '127.0.0.1 localhost\n::1       localhost\n127.0.0.1 magi-system.localdomain magi-system' > /etc/hosts
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id="Windows Boot Manager"
grub-mkconfig -o /boot/grub/grub.cfg
systemctl enable lightdm
echo -e "sxhdc &\nexec bspwm" > ~/.xinitrc
useradd -m -g users -G wheel -s /bin/bash clepin
echo "Password Clepin"
passwd clepin
echo "Password root"
passwd
EDITOR=vim visudo
#su - clepin
