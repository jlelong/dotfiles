# Use Emac kinbindings
bindkey -e

export LANG=en_US.UTF-8
# Do not add : at the end otherwise . is added to the PATH
# export PATH="$PATH:/opt/local/bin:$HOME/bin"
export PATH="/usr/local/opt/python/libexec/bin:$PATH:$HOME/bin:$HOME/live/teaching/ensimag/tools/chamilotools"
export MANPATH="/usr/local/share/man:/usr/share/man:/opt/local/share/man:"

fpath=(/usr/local/share/zsh-completions $fpath)
autoload -U compinit && compinit

# Force filename completion after "="
setopt magic_equal_subst
# Case insensitive completion for simple completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
# visual completion
zstyle ':completion:*' menu select
bindkey '^[[Z' reverse-menu-complete # [S-Tab] to move backward in the completion menu
# Avoid no match found in a series of patterns
setopt nonomatch

[ -f ~/.alias.sh ] && source ~/.alias.sh
# zmv is a massive renaming tool. Try with -n first
autoload -U zmv
autoload -U colors && colors
autoload -U promptinit && promptinit

# personnal completions
compdef '_files -g "*.pdf"' Skim


# setopt PROMPT_SUBST
precmd()
{
    # Terminal title
    print -Pn  "\e]0;%m: %d \a"
    local current_path="$(print -P "%d")"
    local jobcount=" "
    [[ $(jobs -s | wc -l) -gt 0 ]] && jobcount=" %{$fg[yellow]%}✘%{$fg[magenta]%} " 

    local GIT_REF
    GIT_REF=$(git symbolic-ref HEAD 2> /dev/null)
    GIT_REF="${GIT_REF#refs/heads/}"
    if [[ -n ${GIT_REF} ]]; then
        local GIT_STATE=""
        local GIT_STASH=""
        if ! git diff --quiet 2> /dev/null || ! git diff --cached --quiet 2> /dev/null; then
            GIT_STATE="+"
        fi
        if [[ -n "$(git stash list 2>/dev/null)" ]]; then
            GIT_STASH="•"
        fi
        GIT_REF="[$GIT_REF$GIT_STATE$GIT_STASH] "
    fi
    (( cols = $COLUMNS * 3/8))
    PS1="%B%{$fg[magenta]%}⇒ %m:%${cols}<..<%~%<<${jobcount}${GIT_REF}$%{$reset_color%}%b "
}

# History related stuff
setopt hist_ignore_space
setopt hist_ignore_all_dups
export HISTFILE=$HOME/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000
# Some highligthing stuff. I do not like it
# export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/usr/local/share/zsh-syntax-highlighting/highlighters
# source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export EDITOR="/usr/local/bin/vim"
export MAKEFLAGS="-j$(sysctl -n hw.ncpu)"
# BREW_PKG_CONFIG_PATH=$(brew --env | grep PKG_CONFIG | sed 's/.*"\(.*\)"/\1/')
# export PKG_CONFIG_PATH="$BREW_PKG_CONFIG_PATH:/opt/X11/lib/pkgconfig"
# Do not put ._ files in tarballs
export COPYFILE_DISABLE=1
