#!/bin/bash
# Setup script for my debian computers
if [ -z $(for i in `ip r`; do echo $i; done | grep -A 1 src | tail -n1) ]
then
	echo "Error connecting to the internet, please try again."
	exit 1
fi
	
# Update the system
echo "Updating the system"
sudo apt update
sudo apt upgrade
sudo apt autoremove

# Download common programs
echo "Downloading common programs"
sudo apt install htop git tmux vim gcc make valgrind gdb gforth w3m libncurses-dev acpi nasm neofetch
sudo apt install wicd-curses

# Create project folder
echo "Creating the project folder"
cd ~/
mkdir proj
cd proj
mkdir local
mkdir test
mkdir other
mkdir github
cd github

# Download projects
echo "Cloning projects"
git clone https://github.com/mckenney5/bfi.git
git clone https://github.com/mckenney5/c-code-snips.git
git clone https://github.com/mckenney5/command-line-tools.git
git clone https://github.com/mckenney5/config-files.git
git clone https://github.com/mckenney5/delta-linux.git
git clone https://github.com/mckenney5/forth-code-snips.git
git clone https://github.com/mckenney5/lang-comparision.git
git clone https://github.com/mckenney5/linenoise-mob.git
git clone https://github.com/mckenney5/ncurses-engine.git
git clone https://github.com/mckenney5/NodeChan.git
git clone https://github.com/mckenney5/pull-all.git
git clone https://github.com/mckenney5/qsh.git
git clone https://github.com/mckenney5/slim-cat.git
git clone https://github.com/mckenney5/so-forth.git
git clone https://github.com/mckenney5/sudo-kit.git
git clone https://github.com/mckenney5/x86-intel-code-snips.git

# Install the config files
echo "Installing the config files"
cd config-files
make install

read -p "Would you like to download optional programs? [y/n] " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
	echo "Done."
	exit 1
fi
sudo apt install firefox-esr libreoffice keepassx pithos youtube-dl sl toilet cowsay vlc espeak vrms bsdgames scrot nmap wikipedia2text
firefox https://www.veracrypt.fr/en/Downloads.html &

echo "Done."
