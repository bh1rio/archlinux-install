parted -s -m /dev/sda mktable msdos
parted -s -m /dev/sda mkpart primary linux-swap 0% 8GB
parted -s -m /dev/sda mkpart primary ext4 8GB 100%
mkswap /dev/sda1
swapon /dev/sda1
mkfs.ext4 /dev/sda2
mount /dev/sda2 /mnt
echo "Server = https://mirrors.ustc.edu.cn/archlinux/\$repo/os/\$arch" > /etc/pacman.d/mirrorlist
pacstrap /mnt
genfstab -U -p /mnt >> /mnt/etc/fstab
echo "en_US.UTF-8 UTF-8" > /mnt/etc/locale.gen
arch-chroot /mnt locale-gen
echo LANG=en_US.UTF-8 > /mnt/etc/locale.conf
rm /mnt/etc/localtime
arch-chroot /mnt ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
arch-chroot /mnt hwclock --systohc --utc
echo black > /mnt/etc/hostname
arch-chroot /mnt mkinitcpio -p linux
arch-chroot /mnt passwd
arch-chroot /mnt pacman -Sq grub dialog wpa_supplicant
arch-chroot /mnt grub-install --target=i386-pc /dev/sda
arch-chroot /mnt grub-mkconfig -o /boot/grub/grub.cfg
umount -R /mnt
reboot