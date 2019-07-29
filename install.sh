#! /bin/bash

# TODO
# In progress bootstrap
#
# Debian
# sudo add-apt-repository -y ppa:kelleyk/emacs
# sudo apt-get update
# # Remove old versions of emacs
# sudo apt remove --autoremove -y emacs emacs-nox
# # TODO should probably have a method of determining to install
# # emacs vs emacs-nox instead of doing both
# sudo apt-get install -y python-pip stow zsh emacs26 emacs26-nox
# pip install Pygments
#
# MacOS is different


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

# Target the user's home directory instead of the default
# parent directory
mstow() {
    stow -t "$HOME" $@
}

# TODO there should be some way to say just do all the folders in the current directory
mstow {emacs,info,tmux,vim,zsh}
