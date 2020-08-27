# Path to your oh-my-zsh configuration.
typeset -U path PATH
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="mgutz"

DISABLE_AUTO_TITLE="true"

plugins=(git osx web-search yarn)

eval "$(rbenv init - zsh)"

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
source $ZSH/oh-my-zsh.sh

export PATH="$GOPATH/bin:/usr/local/sbin:~/.rbenv/bin:~/bin:/usr/local/share/npm/bin:/usr/local/share/npm/bin:/usr/local/share/git-core/contrib/diff-highlight:$PATH"
alias ls='gls -a --color'
eval "$(hub alias -s)"
alias cd-ghq='cd $(ghq list -p | peco)'
alias vi=vim
alias be='bundle exec'

alias ci='`git log --oneline | peco |cut -c 1-7`' -g
alias atom='code'
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
alias chrome-canary="/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary"

if [ -f ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

[[ -s "/Users/pastak/.gvm/scripts/gvm" ]] && source "/Users/pastak/.gvm/scripts/gvm"
if [ -e /usr/local/share/zsh-completions ]; then
    fpath=(/usr/local/share/zsh-completions $fpath)
fi
fpath=($HOME/.zsh/completions $fpath)

# OPAM configuration
. /Users/pastak/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/pastak/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/pastak/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/pastak/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/pastak/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
