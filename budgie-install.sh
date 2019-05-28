pacman -S --noconfirm xorg xorg-xinit xf86-video-intel xf86-input-synaptics
pacman -S --noconfirm budgie-desktop budgie-extras  lightdm-gtk-greeter lightdm-gtk-greeter-settings
pacman -S --noconfirm galculator midori parole ristretto
wget https://github.com/bh1rio/archlinux-install/raw/master/xinitrc-xfce4
mv xinitrc-budgie .xinitrc
wget https://github.com/bh1rio/archlinux-install/raw/master/app-install.sh
chmod +x app-install.sh
