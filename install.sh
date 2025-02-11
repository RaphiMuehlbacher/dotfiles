#!/bin/bash

echo "Updating package list"
sudo apt update -y

echo "Installing essential tools..."
sudo apt install -y build-essential

# git
echo "installing git"
sudo apt install -y git

# curl
echo "installing curl"
sudo apt install -y curl

# brew
# sudo chown -R $(whoami) /home/linuxbrew/.linuxbrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# zsh
echo "installing zsh"
sudo apt install -y zsh
sudo chsh -s $(which zsh) $USER

# oh-my-zsh
echo "installing oh-my-zsh"
RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# zsh-autosuggestions
echo "installing zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# zsh-syntax-highlighting
echo "installing zsh-syntax-highlighting"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

echo "installing starship"
curl -sS https://starship.rs/install.sh | sh

# fzf
echo "installing fzf"
sudo apt install -y fzf

# tmux
echo "installing tmux"
sudo apt install -y tmux
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
git clone -b v2.1.2 https://github.com/catppuccin/tmux.git ~/.config/tmux/plugins/catppuccin/tmux

# fd
echo "installing fd"
brew install fd

# eza
echo "installing eza"
brew install eza

# zoxide
echo "installing zoxide"
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh

# bat
echo "installing bat"
brew install bat

# lazyvim
echo "installing lazyvim"
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git
