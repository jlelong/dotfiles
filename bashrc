# .bashrc

# Do not add : at the end otherwise . is added to the PATH
# export PATH="$PATH:/opt/local/bin:$HOME/bin"
export PATH="/usr/local/bin:$PATH:$HOME/bin"
export MANPATH="/usr/local/share/man:/usr/share/man:/opt/local/share/man:"

PROMPT_COMMAND=jl_prompt
function jl_prompt 
{
    echo -ne "\033]0;${HOSTNAME%%.*}: ${PWD/$HOME\//~/}\007"
    thedate=$(date '+%H:%M')
    # PS1='\[\033[1;7m\]$(hostname -s):\w$(jobcount)\$\[\033[0m\] '
    PS1='\[\033[1;35m\]$(hostname -s):\w$(jobcount)\[\033[0m\]\[\033[1;35m\]\$\[\033[0m\] '
    # PS1='\[\033[1;35m\]$(hostname -s)$(jobcount)\$\[\033[0m\] '
    # PS1='\[\033[1;35m\]($thedate) -- $(pwd)$(jobcount)\[\033[0m\]\n\[\033[1;35m\]$(hostname -s) \$\[\033[0m\] '
}

function jobcount 
{
   stopped="$(jobs -s | wc -l | tr -d " ")"
   if [ ${stopped} -gt 0 ]; then
       echo -n " (${stopped} stopped)"
   else
       echo -n ""
   fi
}


#loading colors for ls
# [ -f ~/.dir_colors ] &&  eval `/opt/local/bin/gdircolors ~/.dir_colors`


[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
[ -f /etc/bash_completion ] && . /etc/bash_completion
[ -f ~/.complete.sh ] && source ~/.complete.sh
[ -f ~/.alias.sh ] && source ~/.alias.sh

BREW_PKG_CONFIG_PATH=$(brew --env | grep PKG_CONFIG | sed 's/.*"\(.*\)"/\1/')
export PKG_CONFIG_PATH="$BREW_PKG_CONFIG_PATH:/opt/X11/lib/pkgconfig"
export RSHCOMMAND='ssh'
export GROFF_NO_SGR=1
export HISTFILESIZE=10000
# no consecutive duplicate in previous command
export HISTCONTROL=ignoreboth
export LANG="en_US.UTF-8"
export LC_ALL="fr_FR.UTF-8"
export GNUTERM="x11"
export GIT_PAGER="less"
export EDITOR="/usr/local/bin/vim"
export COPYFILE_DISABLE=1
export TEXINPUTS=":.:$HOME/local/latex//:"

# export PYTHONPATH="/usr/local/lib/python2.7/site-packages:$PYTHONPATH"
# eval $(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib)
