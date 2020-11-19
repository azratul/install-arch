#!/bin/sh

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
git clone https://aur.archlinux.org/yay.git
cd ./yay/
makepkg -si
cd ..
rm -rf yay/
yay -S nvidia-340xx nvidia-340xx-utils polybar
