pacman -S xorg xorg-xinit xf86-video-intel xf86-input-synaptics
pacman -S xfce4 xfce4-goodies xfce4-terminal lightdm-gtk-greeter lightdm-gtk-greeter-settings
pacman -S galculator midori parole ristretto
wget https://github.com/bh1rio/archlinux-install/raw/master/xinitrc-xfce4
mv xinitrc-xfce4 .xinitrc
