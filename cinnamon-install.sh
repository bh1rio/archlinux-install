pacman -S --noconfirm xorg xorg-xinit xf86-video-intel xf86-input-synaptics
pacman -S --noconfirm cinnamon
pacman -S --noconfirm gnome-terminal
wget https://github.com/bh1rio/archlinux-install/raw/master/xinitrc
mv xinitrc .xinitrc
wget https://github.com/bh1rio/archlinux-install/raw/master/app-install.sh
chmod +x app-install.sh
