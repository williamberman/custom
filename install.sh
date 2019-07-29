#! /bin/bash

cd ~

# Preferred directory structure
mkdir -p {git/personal,tmp,bin}

# Install oh my zsh
# https://github.com/robbyrussell/oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install oh my tmux
# https://github.com/gpakosz/.tmux
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf

# Install spacemacs
# spacemacs.org
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d

# Install dot files
git clone https://github.com/williamberman/custom ~/git/personal/custom
cd ~/git/personal/custom/dotfiles
stow
