#!/usr/bin/env bash
set -vx

export HOME=/root
export USER=root


#############################################
# Swap

# Add swap: https://help.ubuntu.com/community/SwapFaq
swapFile=/mnt/${swap_size}GiB.swap
fallocate -l ${swap_size}g $swapFile
chmod 600 $swapFile
mkswap $swapFile
swapon $swapFile

# Add the swap file details to /etc/fstab so it will be available at bootup:
echo "$swapFile swap swap defaults 0 0" | sudo tee -a /etc/fstab

echo 'vm.swappiness=10' >> /etc/sysctl.conf

#############################################
# Lamp server

apt-get update
apt-get install -y lamp-server^

#############################################
# Dev tools

apt-get install -y \
  composer \
  git


#############################################
# Apache

a2enmod rewrite


#############################################
# PHP

# PPA for PHP.
add-apt-repository \
  ppa:ondrej/php \
  ppa:ondrej/apache2

apt-get update

phpVer=7.2
apt-get install -y \
  libjpeg-dev \
  libpng-dev \
  php$phpVer-{gd,xml,zip}


#############################################
# Drupal
# Install Drupal using Composer https://github.com/drupal-composer/drupal-project

drupalRoot=/var/www/drupal

composer create-project \
  drupal-composer/drupal-project:8.x-dev \
  $drupalRoot \
  --stability dev \
  --no-interaction

cd $drupalRoot
composer require drupal/devel:~1.0

set +vx
