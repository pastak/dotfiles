#!/bin/sh
DOT_DIRECTORY=$(pwd)

xcode-select --install
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update
brew install peco mercurial zsh rbenv ruby-build tmux reattach-to-user-namespace hub
brew install vim --with-lua
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.1/install.sh | bash
zsh < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
gvm install go1.6.3 -B
gvm use go1.6.3
export GOROOT_BOOTSTRAP=$GOROOT
gvm install go1.8
gvm use go1.8

mkdir -p ~/.tmux/plugins ~/bin/

# download tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

git submodule init
git submodule update

# download diff-hightlight
curl https://raw.github.com/git/git/master/contrib/diff-highlight/diff-highlight -o diff-highlight
chmod +x diff-highlight
mv diff-highlight ~/bin

# tmux-pbcopy
curl https://gist.githubusercontent.com/pastak/8223238b0c46fcc82db6/raw/90996e0b77398c68b14265c7927b49e063100811/gistfile1.txt > ~/bin/tmux-pbcopy

# dein.vim
mkdir -p ~/.vim/rc
ln -snfv ${DOT_DIRECTORY}/vim/rc/dein.toml ${HOME}/.vim/rc/dein.toml

for f in .??*
do
    [[ ${f} = ".git" ]] && continue
    [[ ${f} = ".gitignore" ]] && continue
    [[ ${f} = "initialize.sh" ]] && continue
    [[ ${f} = "vim" ]] && continue
    ln -snfv ${DOT_DIRECTORY}/${f} ${HOME}/${f}
done

echo "*** Install some App by yourself ***"
echo "Install Atom Editor https://atom.io/docs/latest/getting-started-installing-atom"
echo "Install atom-sync-settings https://github.com/Hackafe/atom-sync-settings"
echo "  `% apm install sync-settings`"
echo "Sync settings from e25710cba9a8770a4d70 and set pastak's token"
echo "*** /END ***"
