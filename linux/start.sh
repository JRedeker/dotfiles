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
pyenv latest install -n
pyenv latest global

#PIP
echo "Updating PIP..."
pip install --upgrade pip
pipupdate=$(pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U )
echo pipupdate

echo "All Updated"
