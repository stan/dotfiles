function add_to_path {
  export PATH="$1:$PATH"
}

extract () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)  tar xjf $1      ;;
            *.tar.gz)   tar xzf $1      ;;
            *.bz2)      bunzip2 $1      ;;
            *.rar)      unrar x $1      ;;
            *.gz)       gunzip $1       ;;
            *.tar)      tar xf $1       ;;
            *.tbz2)     tar xjf $1      ;;
            *.tgz)      tar xzf $1      ;;
            *.zip)      unzip $1        ;;
            *.Z)        uncompress $1   ;;
            *)          echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

export PATH="/opt/ruby-enterprise-1.8.6/bin:/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/usr/local/git/bin:/usr/local/scala/bin:/usr/local/erlang/bin:$PATH"

# rvm gem related
if [ -s ~/.rvm/scripts/rvm ] ; then source ~/.rvm/scripts/rvm ; fi
	
# no care of case for completion
bind "set completion-ignore-case on"

# set PATH so it includes user's private bin if it exists
if [ -d ~/bin ] ; then
    PATH=~/bin:"${PATH}"
fi

# misc
add_to_path "$HOME/dot-rot/bin"

# other misc
export HISTCONTROL=ignoredups
export HISTIGNORE="&:ls:ll:cd \-:ls -l:cd ..:l:h" 
export CLICOLOR=1;
export EDITOR=mate

# Load everything up
source "$HOME/dotfiles/files/aliases"

# Setup Rake tab completion
complete -C "$HOME/dotfiles/bin/rake_tabber" -o default rake

# Keep machine-specific stuff in .bash_local
touch ~/.bash_local
source ~/.bash_local

# Mercurial & OSX Terminal issues
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# welcome msg
clear;
echo -ne "${COLOR_GRAY}Uptime: "; uptime
echo -ne "${COLOR_GRAY}Server time is: "; date
