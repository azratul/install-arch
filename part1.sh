#!/bin/sh

loadkeys es
ln -sf /usr/share/zoneinfo/America/Santiago /etc/localtime
# Replace with sed
nvim /etc/pacman.conf
pacman-key --init
pacman-key --populate archlinuxarm
pacman -Syu
pacman -S neovim alacritty lightdm lightdm-gtk-greeter xorg-server xorg-xinit xorg-xinput xorg-xhost xorg-xev rsync sudo udisks2 usbutils mtpfs gvfs-mtp gvfs-gphoto2 git openssh base-devel jq htop nmap nbtscan ettercap tcpdump jp2a imagemagick xdg-utils sxiv entr nitrogen xclip groff zathura zathura-pdf-mupdf zathura-ps zathura-cb zathura-djvu notify-osd libnotify picom dmenu neofetch bspwm sxhkd stow xf86-video-fbdev xorg-xrefresh dialog bash-completion bluez pulseaudio pulseaudio-alsa pulseaudio-bluetooth alsa-utils lsd bat bc ntp wpa_supplicant
sed -i 's/#es_CL.UTF-8/es_CL.UTF-8/g' /etc/locale.gen
locale-gen
echo 'LANG=es_CL.UTF-8' > /etc/locale.conf
systemctl enable lightdm
echo -e "sxhdc &\nexec bspwm" > ~/.xinitrc
useradd -m -g users -G wheel -s /bin/bash clepin
echo "Password Clepin"
passwd clepin
EDITOR=nvim visudo
passwd
# Replace with sed
nvim /etc/ssh/sshd_config
echo 'setxkbmap -layout latam -variant deadtilde' > /home/clepin/.xprofile
mkdir -p /home/clepin/.config/bspwm /home/clepin/.config/sxhkd /home/clepin/Apps/Database
cp /usr/share/doc/bspwm/examples/bspwmrc /home/clepin/.config/bspwm
cp /usr/share/doc/bspwm/examples/sxhkdrc /home/clepin/.config/sxhkd
chown clepin:users -R /home/clepin/.config
chown clepin:users -R /home/clepin/.xprofile
wifi-menu
netctl enable --now wlan0-Andromeda-5G
pacman -S pavucontrol thunar oath-toolkit zbar ranger iftop cfitsio xdotool
systemctl enable --now bluetooth.service
systemctl enable --now brcm43438.service
userdel alarm
ntpd -qg
systemctl enable --now ntpd

su - clepin
git clone https://aur.archlinux.org/yay.git
cd ./yay/
makepkg -si
cd ..
rm -rf yay
yay -S x2x lightdm-webkit-theme-aether tdrop kubectl-bin polybar pi-bluetooth ttf-fira-code ttf-inconsolata ttf-iosevka ttf-inconsolata
sudo pacman -S firefox bashtop openconnect docker blueman mplayer jdk-openjdk cmatrix helm
sudo usermod -aG docker clepin
curl -fLo $HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
curl -fLo $HOME/.config/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
git clone git@github.com:azratul/dotfiles.git
git clone git@github.com:azratul/powerline-go.git
curl -sL https://dbeaver.io/files/21.1.3/dbeaver-ce-21.1.3-linux.gtk.aarch64-nojdk.tar.gz > dbeaver-ce-21.1.3-linux.gtk.aarch64-nojdk.tar.gz
tar -xf dbeaver-ce-21.1.3-linux.gtk.aarch64-nojdk.tar.gz -C /home/clepin/Apps/Database
rm dbeaver-ce-21.1.3-linux.gtk.aarch64-nojdk.tar.gz
