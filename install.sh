#!/bin/bash

echo "Updating package list"
sudo apt update -y

echo "Installing essential tools..."

# git
echo "installing git"
sudo apt install -y git
git config --global user.name="Raphael Muehlbacher"
git config --global user.email="raphi.muehlbacher@gmail.com"

# curl
echo "installing curl"
sudo apt install -y curl

# zsh
echo "installing zsh"
sudo apt install zsh
chsh -s $(which zsh)

# oh-my-zsh
echo "installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# starship
echo "installing starship"
curl -sS https://starship.rs/install.sh | sh

# fzf
echo "installing fzf"
sudo apt install -y fzf

# tmux
sudo apt install tmux
