parted -s -m /dev/sda mktable msdos
parted -s -m /dev/sda mkpart primary ext4 0% 100%
mkfs.ext4 /dev/sda1
mount /dev/sda1 /mnt
echo "Server = https://mirrors.tuna.tsinghua.edu.cn/archlinux/\$repo/os/\$arch" > /etc/pacman.d/mirrorlist
pacstrap /mnt base linux linux-firmware vi sudo
genfstab -U /mnt >> /mnt/etc/fstab
echo "en_US.UTF-8 UTF-8" > /mnt/etc/locale.gen
# echo "zh_CN.UTF-8 UTF-8" >> /mnt/etc/locale.gen
arch-chroot /mnt locale-gen
echo LANG=en_US.UTF-8 > /mnt/etc/locale.conf
rm /mnt/etc/localtime
arch-chroot /mnt ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
arch-chroot /mnt hwclock --systohc --utc
echo arch > /mnt/etc/hostname
arch-chroot /mnt mkinitcpio -p linux
# arch-chroot /mnt passwd
arch-chroot /mnt pacman -S --noconfirm grub intel-ucode
arch-chroot /mnt grub-install --target=i386-pc /dev/sda
arch-chroot /mnt grub-mkconfig -o /boot/grub/grub.cfg
umount -R /mnt
reboot
