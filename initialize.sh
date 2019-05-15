#!/bin/sh
DOT_DIRECTORY=$(pwd)

xcode-select --install
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update
brew install peco mercurial zsh rbenv ruby-build tmux reattach-to-user-namespace hub wget gnutls
brew install vim --with-lua
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.1/install.sh | bash

mkdir -p ~/.tmux/plugins ~/bin/

# download tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

git submodule init
git submodule update

# download diff-hightlight
wget https://raw.github.com/git/git/master/contrib/diff-highlight/diff-highlight -o diff-highlight
chmod +x diff-highlight
mv diff-highlight ~/bin

# tmux-pbcopy
curl https://gist.githubusercontent.com/pastak/8223238b0c46fcc82db6/raw/gistfile1.txt > ~/bin/tmux-pbcopy

# dein.vim
mkdir -p ~/.vim/rc
ln -snfv ${DOT_DIRECTORY}/vim/rc/dein.toml ${HOME}/.vim/rc/dein.toml

sh ${DOT_DIRECTORY}/symlink.sh
