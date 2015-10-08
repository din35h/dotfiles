
# Source Prezto. {{{
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# }}}


# Customize to your needs...
#
# base -16 {{{

BASE16_SHELL="/home/dinesh/.config/base16-shell/base16-railscasts.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

# }}}


# Enabling zsh completion menu {{{
autoload -U compinit && compinit

# }}}
#
#
# Enabling Coloring {{{
autoload -U colors && colors

# }}}
#

## Configuration file zshell ALIASES

## Terminal {{{

alias quit='exit'
alias c='clear'
alias s='sudo'
alias :q='quit'
alias fu='sudo $(fc -n -l -1)'
alias v='vim'
alias sv='sudo vim'
alias vol='alsamixer'
alias cav='cava -i fifo -p /tmp/mpd.fifo -c magenta'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias rm='rm -I'
alias cp='cp -vi'
alias mv='mv -i'
alias ll='ls -alhF'
alias la='ls -A'
alias l='ls -CF'
alias e='exit'
alias clock='tty-clock -c -D'
alias tweet='rainbowstream'
alias chat='irssi'
alias fuckoff='poweroff'
alias dbrem='sudo rm /var/lib/pacman/db.lck'
alias bigfiles='find . -size +250M -exec ls -a --size -h {} \+ | sort -rh'

#}}}


## easier extraction {{{ 
extract () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2) tar xvjf $1;;
            *.tar.gz) tar xvzf $1;;
            *.bz2) bunzip2 $1;;
            *.rar) unrar x $1;;
            *.gz) gunzip $1;;
            *.tar) tar xvf $1;;
            *.tbz2) tar xvjf $1;;
            *.tgz) tar xvzf $1;;
            *.zip) unzip $1;;
            *.Z) uncompress $1;;
            *.7z) 7za x $1;;
            *) echo "'$1' cannot be extracted via >extract<" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# }}}


# auto-cd into a created directory {{{
mcd () {
    mkdir $@ && cd $_
}

#}}}


# auto-ls after changing directory {{{
cd () {
    builtin cd $@ && ls -CF
}

# }}}


## For Termite {{{

eval $(dircolors ~/.dircolors)

# }}}


# Sets xfce4-terminal colors to 256 {{{
if [[ "$COLORTERM" == "xfce4-terminal" ]]; then
    export TERM=xterm-256color
else
    export TERM=xterm
fi

# }}}


# alises taken from justin.abrah.ms {{{

alias ..='cd ..'            # Go up one directory
alias ...='cd ../..'        # Go up two directories
alias ....='cd ../../..'    # And for good measure
alias tmux='TERM=xterm-256color \tmux'
alias ping='ping -c 5 google.com'      # Pings with 5 packets, not unlimited
alias df='df -h'
alias du='du -h -c'
alias grep='grep --color=auto'
alias gc='git clone'
alias gr='git stash && git svn rebase && git svn dcommit && git stash pop' # git refresh

# }}}


# URL encode something and print it. {{{
function url-encode; {
setopt extendedglob
 echo "${${(j: :)@}//(#b)(?)/%$[[##16]##${match[1]}]}"
 }
# }}}

# Search google for the given keywords. {{{
function google; {
$VIEW "http://www.google.com/search?q=`url-encode "${(j: :)@}"`"
}

# }}}

# run last command as root {{{
	root () {
	sudo $(fc -n -1 -1)
	}
# }}}
