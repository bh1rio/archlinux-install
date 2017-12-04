parted -s -m /dev/sda mktable gpt
parted -s -m /dev/sda mkpart primary linux-swap 0% 8GB
parted -s -m /dev/sda mkpart primary ext4 8GB 100%
mkswap /dev/sda1
swapon /dev/sda1
mkfs.ext4 /dev/sda2
mount /dev/sda2 /mnt
echo "Server = https://mirrors.ustc.edu.cn/archlinux/\$repo/os/\$arch" > /etc/pacman.d/mirrorlist
pacstrap -i /mnt
genfstab -U -p /mnt >> /mnt/etc/fstab
arch-chroot /mnt echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
arch-chroot /mnt locale-gen