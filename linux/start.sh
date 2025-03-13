#!/bin/bash

echo "updating and upgrading apt packages..."
sudo apt update -y
sudo apt upgrade -y
sudo apt autoremove -y
sudo apt autoclean -y

#NVM
echo "Updating nvm..."
nvm upgrade
echo "Upgrading node..."
nvm install --lts
nvm use --lts


#NPM
echo "Updating npm..."
npm install -g npm@latest -y
npm update -g -y


#Pyenv & Python
echo "Upgrading Python..."
pyenv update
pyenv install latest
pyenv global latest

#PIP
echo "Updating PIP..."
pip install --upgrade pip

