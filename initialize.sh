#!/bin/sh
DOT_DIRECTORY=$(pwd)

if [ "$(uname)" == 'Darwin' ]; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew update
  brew install go nvm peco zsh rbenv ruby-build vim tmux reattach-to-user-namespace hub
  zsh < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
    sudo apt-get -y install zsh nvm rbenv ruby-build tmux
    chsh -s $(which zsh)
    # Install Peco
    zsh < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
    gvm install go1.4
    gvm use go1.4 --default
    go get github.com/peco/peco/cmd/peco
    # Install hub
    go get github.com/github/hub
else
fi

mkdir -p ~/.tmux/plugins ~/bin/

# download tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# download diff-hightlight
curl https://raw.github.com/git/git/master/contrib/diff-highlight/diff-highlight -o diff-highlight
chmod +x diff-highlight
mv diff-highlight ~/bin

# tmux-pbcopy
curl https://gist.githubusercontent.com/pastak/8223238b0c46fcc82db6/raw/90996e0b77398c68b14265c7927b49e063100811/gistfile1.txt > ~/bin/tmux-pbcopy

# NeoBundle
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh > install.sh
sh ./install.sh
rm ./install.sh

for f in .??*
do
    [[ ${f} = ".git" ]] && continue
    [[ ${f} = ".gitignore" ]] && continue
    [[ ${f} = "initialize.sh" ]] && continue
    ln -snfv ${DOT_DIRECTORY}/${f} ${HOME}/${f}
done

echo "*** Install some App by yourself ***"
echo "Install Atom Editor https://atom.io/docs/latest/getting-started-installing-atom"
echo "Install atom-sync-settings https://github.com/Hackafe/atom-sync-settings"
echo "  `% apm install sync-settings`"
echo "Sync settings from e25710cba9a8770a4d70 and set pastak's token"
echo "*** /END ***"
