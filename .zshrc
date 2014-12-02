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
eval "$(plenv init - zsh)"
eval "$(phpenv init - zsh)"
source $ZSH/oh-my-zsh.sh
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

if [ -f ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# autocd via http://qiita.com/yaotti/items/157ff0a46736ec793a91
setopt AUTO_CD
cdpath=(.. ~)

source ~/.nvm/nvm.sh
#source ~/tools/zsh-notify/notify.plugin.zsh
#export SYS_NOTIFIER="/usr/local/bin/terminal-notifier"
export NOTIFY_COMMAND_COMPLETE_TIMEOUT=20

#alias tmux=tmuxx
# Wrap git automatically by adding the following to ~/.zshrc:

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

# The next line updates PATH for the Google Cloud SDK.
source '/Users/pastak/tools/google-cloud-sdk/path.zsh.inc'

# The next line enables shell command completion for gcloud.
source '/Users/pastak/tools/google-cloud-sdk/completion.zsh.inc'

export PATH="node_modules/.bin:$PATH"
