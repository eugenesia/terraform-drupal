#!/usr/bin/env bash
set -vx

export HOME=/root
export USER=root


#############################################
# Swap

# Add swap: https://help.ubuntu.com/community/SwapFaq
swapFile=/mnt/${swap_size}GiB.swap
fallocate -l ${swap_size}1g $swapFile
chmod 600 $swapFile
mkswap $swapFile
swapon $swapFile

# Add the swap file details to /etc/fstab so it will be available at bootup:
echo "$swapFile swap swap defaults 0 0" | sudo tee -a /etc/fstab

echo 'vm.swappiness=10' >> /etc/sysctl.conf

#############################################
# Lamp server

apt update
apt install tasksel
tasksel install lamp-server


set +vx
