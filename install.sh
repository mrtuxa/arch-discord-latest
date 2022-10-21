#/bin/sh
mkdir tmp \
cd tmp \
sudo pacman -Sy wget \
wget https://raw.githubusercontent.com/mrtuxa/arch-discord-latest/main/PKGBUILD \
sudo pacman -S base-devel \
makepkg -si --skipinteg
