#!/bin/sh
DOT_DIRECTORY=$(pwd)

xcode-select --install
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update
brew install git peco mercurial zsh rbenv ruby-build tmux reattach-to-user-namespace hub wget gnutls vim coreutils
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.1/install.sh | bash

mkdir -p ~/.tmux/plugins ~/bin/

# download tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

git submodule init
git submodule update

# enable diff-hightlight
sudo ln -s /usr/local/share/git-core/contrib/diff-highlight/diff-highlight /usr/local/bin/diff-highlight

# tmux-pbcopy
cp ./tmux-pbcopy ~/bin/tmux-pbcopy
chmod +x ~/bin/tmux-pbcopy

# dein.vim
mkdir -p ~/.vim/rc
ln -snfv ${DOT_DIRECTORY}/vim/rc/dein.toml ${HOME}/.vim/rc/dein.toml

sh ${DOT_DIRECTORY}/symlink.sh
