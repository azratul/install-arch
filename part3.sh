#!/bin/sh

systemctl --user enable pipewire.socket
git clone https://aur.archlinux.org/yay.git
cd ./yay/
makepkg -si
cd ..
rm -rf yay/
sudo pacman -S firefox-developer-edition kubectl mplayer docker blender gimp inkscape dolphin ttf-fira-code noto-fonts-cjk otf-font-awesome ttf-liberation nodejs npm
yay -S gotop wlr-randr fastfetch

# Steam
sudo pacman -S lib32-mesa vulkan-radeon lib32-vulkan-radeon vulkan-icd-loader lib32-vulkan-icd-loader ttf-liberation lib32-systemd wine-staging lib32-giflib lib32-libpng lib32-gnutls lib32-mpg123 openal lib32-openal lib32-v4l-utils lib32-libpulse alsa-plugins lib32-alsa-plugins lib32-alsa-lib lib32-libjpeg-turbo lib32-sqlite lib32-libxcomposite lib32-libxinerama lib32-opencl-icd-loader libxslt lib32-libxslt lib32-libva lib32-gtk3 lib32-gst-plugins-base-libs meson lib32-nvidia-utils vulkan-tools lutris
sudo pacman -S steam
yay -S dxvk-bin vkbasalt

# Virt Manager
sudo pacman -S qemu virt-manager virt-viewer dnsmasq vde2 bridge-utils openbsd-netcat dmidecode
sudo usermod -aG libvirt $(whoami)
sudo systemctl enable --now libvirtd.service
