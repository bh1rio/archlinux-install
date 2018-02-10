pacman -S --noconfirm xorg xorg-xinit xf86-video-intel xf86-input-synaptics
pacman -S --noconfirm xfce4 xfce4-goodies xfce4-terminal lightdm-gtk-greeter lightdm-gtk-greeter-settings
pacman -S --noconfirm galculator midori parole ristretto
wget https://github.com/bh1rio/archlinux-install/raw/master/xinitrc-xfce4
mv xinitrc-xfce4 .xinitrc
wget https://github.com/bh1rio/archlinux-install/raw/master/app-install.sh
chmod +x app-install.sh
