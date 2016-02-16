# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

 ZSH_THEME="robbyrussell"

# Comment this out to disable bi-weekly auto-update checks
 DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
 export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable autosetting terminal title.
 DISABLE_AUTO_TITLE="true"

plugins=(git osx web-search vi-mode rails)

# Customize to your needs...
export PATH=~/.rbenv/bin/:~/.plenv/bin:~/.phpenv/bin:~/bin/:/usr/local/share/npm/bin:$PATH

eval "$(rbenv init - zsh)"
alias ls='gls -a --color'

export LS_COLORS

if [ -f ~/.dircolors ]; then
    if type dircolors > /dev/null 2>&1; then
        eval $(dircolors ~/.dircolors)
    elif type gdircolors > /dev/null 2>&1; then
        eval $(gdircolors ~/.dircolors)
    fi
fi


alias test256='( x=`tput op` y=`printf %$((${COLUMNS}-6))s`;for i in {0..256};do o=00$i;echo -e ${o:${#o}-3:3} `tput setaf $i;tput setab $i`${y// /=}$x;done; )'

# autocd via http://qiita.com/yaotti/items/157ff0a46736ec793a91
setopt AUTO_CD
cdpath=(.. ~)

source ~/.nvm/nvm.sh
export NOTIFY_COMMAND_COMPLETE_TIMEOUT=20

eval "$(hub alias -s)"
compdef hub=git
alias cd-ghq='cd $(ghq list -p | peco)'
alias vi=vim

alias ci='`git log --oneline | peco |cut -c 1-7`' -g
alias atom='atom .'

# git add with peco
# via http://petitviolet.hatenablog.com/entry/20140722/1406034439
function peco-select-gitadd() {
local selected_file_to_add=$(git status --porcelain | \
    peco --query "$LBUFFER" | \
    awk -F ' ' '{print $NF}')
if [ -n "$selected_file_to_add" ]; then
    BUFFER="git add ${selected_file_to_add}"
    CURSOR=$#BUFFER
    zle accept-line
fi
zle clear-screen
}
zle -N peco-select-gitadd
bindkey "^g^a" peco-select-gitadd
export EDITOR=vim
export PATH="/usr/local/sbin:$PATH"

export PATH="node_modules/.bin:$PATH"
export RUBYGEMS_GEMDEPS=-
source $ZSH/oh-my-zsh.sh

if [ -f ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

