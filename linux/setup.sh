#!/bin/bash

# This is to be run ONCE after a new linux box is set up.
# Additional setup will be needed to have all user vars set and keys generated


sudo apt update
sudo apt upgrade -y

# ZSH
if [[ "${NO_ZSH}" != "true" ]]; then
  # switch to zsh
  sudo apt install zsh -y
  sudo chsh gitpod -s "$(command -v zsh || true)"

  # Fix GP alias
  echo "alias pod=/usr/bin/gp" >>~/.zshrc

  # install ohmyzsh
  CHSH=no
  export CHSH # fix broken chsh check
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh || true)" "" --unattended

  # install plugins
  git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}"/plugins/zsh-autosuggestions
  echo "plugins+=zsh-autosuggestions" >>~/.zshrc
  git clone git clone https://github.com/ptavares/zsh-direnv.git "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}"/plugins/zsh-direnv
  echo "plugins+=zsh-direnv" >>~/.zshrc
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}"/plugins/zsh-syntax-highlighting
  echo "plugins+=zsh-syntax-highlighting" >>~/.zshrc
  git clone https://github.com/zsh-users/zsh-completions "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}"/plugins/zsh-completions
  echo "fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src" >>~/.zshrc

  # install powerlevel10k
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-${HOME}/.oh-my-zsh/custom}"/themes/powerlevel10k
  #curl -fsSL https://raw.githubusercontent.com/DRSchlaubi/.gitpod/main/.p10k.zsh -o ~/.p10k.zsh
  echo ZSH_THEME="powerlevel10k/powerlevel10k" >>~/.zshrc

  # install direnv
  curl -sfL https://direnv.net/install.sh | bash || true

  # reload oh-my-zsh instructions again
  echo "source \$ZSH/oh-my-zsh.sh" >>~/.zshrc


fi