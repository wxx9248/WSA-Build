#!/bin/bash

cd MagiskOnWSALocal/scripts

# Create runner account
useradd -m -U runner

# Allow sudo for any users
echo "ALL ALL=NOPASSWD: ALL" >/etc/sudoers.d/10-allow-all-users

# Install dependencies
pacman -S --noconfirm libnewt lzip patchelf e2fsprogs python-pip aria2 p7zip attr unzip qemu-img python-virtualenv sudo erofs-utils ca-certificates fuse2

# Install setools from AUR
sudo -u runner gpg --recv-keys 63191CE94183098689CAB8DB7EF137EC935B0EAF

targets=(libsepol libselinux setools)
for target in $targets; do
    git clone https://aur.archlinux.org/$target.git
    chown -R runner:runner $target

    cd $target
    sudo -u runner makepkg -si --noconfirm
    cd ..
done

# Install other dependencies
bash -x ./install_deps.sh

cd ../..
