#! /bin/bash

set -e

# In progress bootstrap. Only works on debian
# Run as root

add-apt-repository -y ppa:kelleyk/emacs
apt-get update
# Remove old versions of emacs
apt remove --autoremove -y emacs emacs-nox
# TODO should probably have a method of determining to install
# emacs or emacs-nox
# TODO should install tmux (as latest version potentially)
apt-get install -y \
        python-pip \
        stow \
        zsh \
        emacs26
pip install Pygments

m_username="wlbberman"

id -u "$m_username" &>/dev/null || \
    adduser --disabled-password --shell $(which zsh) --gecos "" "$m_username"
usermod -aG sudo "$m_username"

# Execute the rest of the script as the newly created user

# TODO writing the script as a heredoc and then executing it via `runuser`
# feels like a hack
#
# All `$`'s inside the heredoc must be escaped

tmp_script_path="/tmp/tmp_script.sh"

cat << EOF > "$tmp_script_path"
#! /bin/bash

set -e

# Target the user's home directory instead of the default
# parent directory
mstow() {
    stow -t "\$HOME" \$@
}

# Clone the repo if it exists, else pull it
# https://gist.github.com/nicferrier/2277987
mclone() {
    local REPOSRC="\$1"
    local LOCALREPO="\$2"
    git clone "\$REPOSRC" "\$LOCALREPO" || (cd "\$LOCALREPO" ; git pull)
}

cd ~

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
sh -c "\$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

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
EOF

chmod +x "$tmp_script_path"

runuser -l "$m_username" -c "$tmp_script_path"

# TODO ensure this command gets executed
rm "$tmp_script_path"

# TODO log the name of the user created and how to set password
