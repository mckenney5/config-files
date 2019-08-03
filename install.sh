#! /bin/bash
# Install script for config-files
echo "Installing your commonly used programs..."
sudo apt install vim htop tmux git gcc make g++ nasm libncurses5-dev bsdgames espeak

echo "Copying files from src..."
cd src
cp -v bashrc ~/.bashrc
cp -v tmux.conf ~/.tmux.conf
cp -v vimrc ~/.vimrc

echo "Copying fonts..."
mkdir -p ~/.fonts
cp -v fonts/* ~/.fonts/

echo "Copying i3 conf files..."
mkdir -p ~/.i3
cp -v i3/* ~/.i3/

echo "Copying bin files..."
cp -v ../bin/* ~/

echo "Replacing your sources.list file"
sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak
sudo cp -vi sources.list /etc/apt/sources.list

echo "Installation complete!"

echo "Updating..."
sudo apt update
sudo apt upgrade

echo "Done."

