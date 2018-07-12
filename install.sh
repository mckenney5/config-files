#! /bin/bash
# Install script for config-files
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

echo "Installation complete!"
