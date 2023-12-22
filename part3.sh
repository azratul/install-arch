#!/bin/sh

systemctl --user enable pipewire.socket
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
git clone https://aur.archlinux.org/yay.git
cd ./yay/
makepkg -si
cd ..
rm -rf yay/
echo "setxkbmap -layout latam -variant deadtilde" > .xprofile
sudo pacman -S firefox-developer-edition kubectl mplayer docker blender gimp inkscape
git clone https://github.com/azratul/dotfiles
mv dotfiles .dotfiles
cd .dotfiles
stow --adopt home
stow --adopt fonts
