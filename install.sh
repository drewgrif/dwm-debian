#!/bin/bash

# Default packages are for the configuration and corresponding .config folders
# Install packages after installing base Debian with no GUI

# xorg display server installation
sudo apt install -y xorg xbacklight xbindkeys xvkbd xinput

# INCLUDES make,etc.
sudo apt install -y build-essential 

# Microcode for Intel/AMD 
# sudo apt install -y amd64-microcode
sudo apt install -y intel-microcode 

# Network Manager
sudo apt install -y network-manager-gnome

# Installation for Appearance management
sudo apt install -y lxappearance 

# File Manager (eg. pcmanfm,krusader)
sudo apt install -y pcmanfm ranger

# Network File Tools/System Events
sudo apt install -y dialog mtools avahi-daemon acpi acpid 

sudo systemctl enable avahi-daemon
sudo systemctl enable acpid

# Terminal (eg. terminator,kitty)
sudo apt install -y kitty

# Sound packages
sudo apt install -y pulseaudio alsa-utils pavucontrol volumeicon-alsa

# Neofetch/HTOP
sudo apt install -y neofetch htop

# EXA installation
# replace ls command in .bashrc file with line below
# alias ls='exa -al --long --header --color=always --group-directories-first' 
sudo apt install -y exa

# Printing and bluetooth (if needed)
sudo apt install -y cups
sudo apt install -y bluez blueman

sudo systemctl enable bluetooth
sudo systemctl enable cups

# Browser Installation (eg. chromium)
sudo apt install -y firefox-esr 

# Desktop background browser/handler 
# feh --bg-fill /path/to/directory 
# example if you want to use in autostart located in ~/.local/share/dwm/autostart.sh
# sudo apt install -y feh
sudo apt install -y nitrogen 

# Packages needed dwm after installation
sudo apt install -y sxhkd picom numlockx rofi dunst libnotify-bin unzip mousepad scrot

# Command line text editor -- nano preinstalled  -- I like micro but vim is great
# sudo apt install -y micro
sudo apt install -y neovim

# Install fonts
sudo apt install fonts-font-awesome fonts-ubuntu fonts-liberation2 fonts-liberation fonts-terminus 

# Create folders in user directory (eg. Documents,Downloads,etc.)
xdg-user-dirs-update

# Install Lightdm Console Display Manager
sudo apt install -y lightdm lightdm-gtk-greeter-settings slick-greeter
sudo systemctl enable lightdm
echo 'greeter-session=slick-greeter' >>  sudo tee -a /etc/lightdm/lightdm.conf
echo 'greeter-hide-user=false' >>  sudo tee -a /etc/lightdm/lightdm.conf

# XSessions and dwm.desktop
if [[ ! -d /usr/share/xsessions ]]; then
    sudo mkdir /usr/share/xsessions
fi

cat > ./temp << "EOF"
[Desktop Entry]
Encoding=UTF-8
Name=dwm
Comment=Dynamic window manager
Exec=dwm
Icon=dwm
Type=XSession
EOF
sudo cp ./temp /usr/share/xsessions/dwm.desktop;rm ./temp


# Creating directories
mkdir ~/.config/suckless

# Move install directory, make, and install
cd /tmp
tools=( "dwm" "st" "slstatus" "slock" "tabbed" )
for tool in ${tools[@]}
do 
	git clone git://git.suckless.org/$repo
	cd ~/.config/suckless/$tool;make;sudo make clean install;cd ..
done



# Install Nerd Fonts
source ~/dwm-debian/nerdfonts.sh

sudo apt autoremove

printf "\e[1;32mDone! you can now reboot.\e[0m\n"
