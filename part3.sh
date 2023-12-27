#!/bin/sh

systemctl --user enable pipewire.socket
git clone https://aur.archlinux.org/yay.git
cd ./yay/
makepkg -si
cd ..
rm -rf yay/
sudo pacman -S firefox-developer-edition kubectl mplayer docker blender gimp inkscape dolphin ttf-fira-code noto-fonts-cjk otf-font-awesome ttf-liberation nodejs npm
yay -S gotop wlr-randr fastfetch
