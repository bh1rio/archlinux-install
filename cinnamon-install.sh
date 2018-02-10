pacman -S --noconfirm xorg xorg-xinit xf86-video-intel xf86-input-synaptics
pacman -S --noconfirm cinnamon gnome-terminal
pacman -S --noconfirm noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra
wget https://github.com/bh1rio/archlinux-install/raw/master/xinitrc
mv xinitrc .xinitrc
