export HISTFILE="${HOME}/.bash_history_$(basename $(tty))"
export HISTSIZE=50000
export HISTFILESIZE=100000
export PROMPT_COMMAND='history -a'

alias l='ls -xF'
alias ll='ls -l'
# alias em='emacs'
# alias em='open -a /Applications/Emacs.app "$@"'
# alias emacs='open -a /Applications/Emacs.app "$@"'
# alias eq='/usr/local/Cellar/emacs/24.2/bin/emacs-24.2 -nw'
# alias ec=emacsclient

set -o vi
export CDPATH=".:~"

function settitle () { test "$TERM" != "dumb" && echo -ne "]2;$@"; }
function settabtitle () { test "$TERM" != "dumb" && echo -ne "\033]0;$@\\007"; }
mycd() {
	\cd "$@" && ls -xF
    settitle "${PWD/#$HOME/~}"
    settabtitle "${PWD/#$HOME/~}"
}
bak() {
    cp "$1" "$1.bak"
}
unbak() {
    mv "$1"  `echo "$1" | sed -e 's/.bak$//'`
}

alias cd=mycd
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias .......='cd ../../../../../..'
alias ........='cd ../../../../../../..'
alias .........='cd ../../../../../../../..'
alias ..........='cd ../../../../../../../../..'
alias ...........='cd ../../../../../../../../../..'
alias ............='cd ../../../../../../../../../../..'
alias .............='cd ../../../../../../../../../../../..'

shopt -s cmdhist

alias pbcopynn='tr -d "\n" | pbcopy'
alias psgrep='pgrep -l -f'

# colored grep
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;33'

# colored ls
export LSCOLORS='Gxfxcxdxdxegedabagacad'
if [ $TERM != "dumb" ]
then
    export CLICOLOR=true
fi

alias unmount=umount
alias get=git
alias berw=brew

# alias jcr='cd ~/cq5/code/oneurl/webcms-app-package/src/content/jcr_root'
# alias qajcr='cd ~/cq5/code/oneurl/webcms-qasite/src/content/jcr_root'
# alias sync='~/cq5/code/omega/scripts/vlt-sync --no-import'

# alias uatpub='ssh hfear@webcms-dev-pub-01.webapps.rr.com'
# alias webcms-ci='ssh -l hfear webcms-ci.webapps.rr.com'

alias intellij="open -a '/Applications/IntelliJ IDEA 13.app'"

# export http_proxy=http://www-proxy.us.oracle.com:80/
export http_proxy=http://www-proxy-hqdc.us.oracle.com:80/
export https_proxy=$http_proxy
export ftp_proxy=$http_proxy

if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

# for file in ~/.profile.d/*.bash
# do
#     . $file
# done
 
source $HOME/.git-prompt.sh
source $HOME/.bash_completion

# Add rbenv shims
which rbenv > /dev/null && eval "$(rbenv init -)"

# Add jenv shims
eval "$(jenv init -)"
export JAVA_HOME="$(jenv javahome)"
PATH=$JAVA_HOME/bin:$PATH

# Add pyenv shims
which pyenv > /dev/null && eval "$(pyenv init -)"
# This makes python jedi completion work in vi because vim has a compiled path for python.
which pyenv > /dev/null && export PYTHONPATH="$(pyenv prefix)/lib/python2.6/site-packages":$PYTHONPATH

if brew --prefix nvm >/dev/null 2>&1; then
    export NVM_DIR="$HOME/.nvm"
    . "$(brew --prefix nvm)/nvm.sh"
fi

settitle "${PWD/#$HOME/~}"
settabtitle "${PWD/#$HOME/~}"
PS1='\w$(__git_ps1 " [%s]"): '

# Kubernetes
export DIND_HTTP_PROXY=$http_proxy
export DIND_HTTPS_PROXY=$http_proxy
export DIND_NO_PROXY=127.0.0.1,localhost,10.244.0.0/16,192.168.0.0/16,$(ipconfig getifaddr en0)

export ORACLE_UID="$(whoami)"
# alias au1="ssh -o TCPKeepAlive=yes -o ServerAliveInterval=5 -o RequestTTY=yes -o ServerAliveCountMax=10 -D 9991 ${ORACLE_UID}@syd10-c-ad1-bastion-01.ap1.oraclecloud.com"
alias audc1="ssh -o TCPKeepAlive=yes -o ServerAliveInterval=5 -o RequestTTY=yes -o ServerAliveCountMax=10 -D 9991 ${ORACLE_UID}@syd10-c-ad1-bastion-01.ap1.oraclecloud.com"
alias em2="ssh -o TCPKeepAlive=yes -o ServerAliveInterval=5 -o RequestTTY=yes -o ServerAliveCountMax=10 -D 9997 ${ORACLE_UID}@am2-c-fa-bastion-01.em2.oraclecloud.com"
alias em3="ssh -o TCPKeepAlive=yes -o ServerAliveInterval=5 -o RequestTTY=yes -o ServerAliveCountMax=10 -D 9996 ${ORACLE_UID}@ld5-c-fa-bastion-01.em3.oraclecloud.com"
alias jpdc2="ssh -o TCPKeepAlive=yes -o ServerAliveInterval=5 -o RequestTTY=yes -o ServerAliveCountMax=10 -D 9999 ${ORACLE_UID}@mel11-c-fa-bastion-01.ap4.oraclecloud.com"
alias nl1a="ssh -o TCPKeepAlive=yes -o ServerAliveInterval=5 -o RequestTTY=yes -o ServerAliveCountMax=10 -D 9999 ${ORACLE_UID}@130.162.2.21"
alias nldc1="ssh -o TCPKeepAlive=yes -o ServerAliveInterval=5 -o RequestTTY=yes -o ServerAliveCountMax=10 -D 9999 ${ORACLE_UID}@am2-c-fa-bastion-01.em2.oraclecloud.com"
alias sg2="ssh -o TCPKeepAlive=yes -o ServerAliveInterval=5 -o RequestTTY=yes -o ServerAliveCountMax=10 -D 9999 ${ORACLE_UID}@auh1-c-ad1-bastion-01.em8.oraclecloud.com"
alias toronto="ssh -o TCPKeepAlive=yes -o ServerAliveInterval=5 -o RequestTTY=yes -o ServerAliveCountMax=10 -D 9999 ${ORACLE_UID}@ch3-c-fa-bastion-01.us2.oraclecloud.com"
alias ukdc2="ssh -o TCPKeepAlive=yes -o ServerAliveInterval=5 -o RequestTTY=yes -o ServerAliveCountMax=10 -D 9996 ${ORACLE_UID}@ld5-c-fa-bastion-01.em3.oraclecloud.com"
alias ukdc2ukg="ssh -o TCPKeepAlive=yes -o ServerAliveInterval=5 -o RequestTTY=yes -o ServerAliveCountMax=10 -D 9996 ${ORACLE_UID}@lgw14-u-ad1-bastion-01.em2.ukg.oraclecloud.com"
alias ukg="ssh -o TCPKeepAlive=yes -o ServerAliveInterval=5 -o RequestTTY=yes -o ServerAliveCountMax=10 -D 9996 ${ORACLE_UID}@129.145.130.21"
alias us2a="ssh -o TCPKeepAlive=yes -o ServerAliveInterval=5 -o RequestTTY=yes -o ServerAliveCountMax=10 -D 9999 ${ORACLE_UID}@129.150.2.21"
alias us2b="ssh -o TCPKeepAlive=yes -o ServerAliveInterval=5 -o RequestTTY=yes -o ServerAliveCountMax=10 -D 9999 ${ORACLE_UID}@aur1-c-ad1-bastion-01.us2.oraclecloud.com"
alias us6a="ssh -o TCPKeepAlive=yes -o ServerAliveInterval=5 -o RequestTTY=yes -o ServerAliveCountMax=10 -D 9999 ${ORACLE_UID}@129.158.2.21"
alias us7pci1="ssh -o TCPKeepAlive=yes -o ServerAliveInterval=5 -o RequestTTY=yes -o ServerAliveCountMax=10 -D 9999 ${ORACLE_UID}@129.149.2.21"
alias us7pci2="ssh -o TCPKeepAlive=yes -o ServerAliveInterval=5 -o RequestTTY=yes -o ServerAliveCountMax=10 -D 9999 ${ORACLE_UID}@ch3-c-ad1-bastion-01.us7.oraclecloud.com"
alias us2="ssh -o TCPKeepAlive=yes -o ServerAliveInterval=5 -o RequestTTY=yes -o ServerAliveCountMax=10 -D 9999 ${ORACLE_UID}@ch3-c-fa-bastion-01.us2.oraclecloud.com"
alias usdc2="ssh -o TCPKeepAlive=yes -o ServerAliveInterval=5 -o RequestTTY=yes -o ServerAliveCountMax=10 -D 9999 ${ORACLE_UID}@ch3-c-fa-bastion-01.us2.oraclecloud.com"
alias us6="ssh -o TCPKeepAlive=yes -o ServerAliveInterval=5 -o RequestTTY=yes -o ServerAliveCountMax=10 -D 9999 ${ORACLE_UID}@129.158.2.21"
alias usdc6="ssh -o TCPKeepAlive=yes -o ServerAliveInterval=5 -o RequestTTY=yes -o ServerAliveCountMax=10 -D 9999 ${ORACLE_UID}@129.158.2.21"
alias us8="ssh -o TCPKeepAlive=yes -o ServerAliveInterval=5 -o RequestTTY=yes -o ServerAliveCountMax=10 -D 9999 ${ORACLE_UID}@129.149.130.21"
alias usdc8="ssh -o TCPKeepAlive=yes -o ServerAliveInterval=5 -o RequestTTY=yes -o ServerAliveCountMax=10 -D 9999 ${ORACLE_UID}@129.149.130.21"
alias us9="ssh -o TCPKeepAlive=yes -o ServerAliveInterval=5 -o RequestTTY=yes -o ServerAliveCountMax=10 -D 9999 ${ORACLE_UID}@129.156.130.21"
alias usdc9="ssh -o TCPKeepAlive=yes -o ServerAliveInterval=5 -o RequestTTY=yes -o ServerAliveCountMax=10 -D 9999 ${ORACLE_UID}@129.156.130.21"
alias uspp1="ssh -o TCPKeepAlive=yes -o ServerAliveInterval=5 -o RequestTTY=yes -o ServerAliveCountMax=10 -D 9999 ${ORACLE_UID}@ord12-p-fa-bastion-01.pp1.oraclecloud.com"
