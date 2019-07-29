#! /bin/bash

set -e

# In progress bootstrap

sudo add-apt-repository -y ppa:kelleyk/emacs
sudo apt-get update
# Remove old versions of emacs
sudo apt remove --autoremove -y emacs emacs-nox
# TODO should probably have a method of determining to install
# emacs or emacs-nox
sudo apt-get install -y \
     python-pip \
     stow \
     zsh \
     emacs26
pip install Pygments
