parted -s -m /dev/sda mktable gpt
parted -s -m /dev/sda mkpart primary linux-swap 0% 8GB
parted -s -m /dev/sda mkpart primary ext4 8GB 100%
mkswap /dev/sda1
swapon /dev/sda1
mkfs.ext4 /dev/sda2
