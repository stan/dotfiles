function add_to_path {
  export PATH="$1:$PATH"
}

export PATH="/opt/ruby-enterprise-1.8.6/bin:/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/usr/local/git/bin:/usr/local/scala/bin:/usr/local/erlang/bin:$PATH"

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
