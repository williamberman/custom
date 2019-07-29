#! /bin/bash

set -e

# Target the user's home directory instead of the default
# parent directory
mstow() {
    stow -t "$HOME" $@
}

# Clone the repo if it exists, else pull it
# https://gist.github.com/nicferrier/2277987
mclone() {
    local REPOSRC="$1"
    local LOCALREPO="$2"
    git clone "$REPOSRC" "$LOCALREPO" || (cd "$LOCALREPO" ; git pull)
}

# Preferred directory structure
mkdir -p {git/personal,tmp,bin}

# Install dot files
mclone https://github.com/williamberman/custom ~/git/personal/custom
cd ~/git/personal/custom/dotfiles

# TODO there should be some way to say just do all the folders in the current directory
mstow {emacs,info,tmux,vim}

cd ~

# Install oh my zsh
# https://github.com/robbyrussell/oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Installing oh my zsh will overwrite ~/.zshrc, so the stow has to occur after
# installation
rm ~/.zshrc
pushd ~/git/personal/custom/dotfiles
mstow zsh
popd

# Install oh my tmux
# https://github.com/gpakosz/.tmux
mclone https://github.com/gpakosz/.tmux.git ~/.tmux
ln -s -f .tmux/.tmux.conf

# Install spacemacs
# spacemacs.org
mclone https://github.com/syl20bnr/spacemacs ~/.emacs.d

# Set the default shell to zsh
sudo usermod --shell $(which zsh) $(whoami)
