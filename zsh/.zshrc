# XDG Base Directory specification
export XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
export XDG_STATE_HOME=${XDG_STATE_HOME:-$HOME/.local/state}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:-$HOME/.cache}

# Powerlevel10k instant prompt (speed up Zsh startup)
if [[ -r "${XDG_CACHE_HOME}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Prevent accidental file overwrites with > and >>
setopt noclobber

# Better cd navigation
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus

# Safety nets (Ask for confirmation)
alias rm='rm -I'

# Zsh history settings
export HISTFILE="$XDG_STATE_HOME/zsh/histfile"
HISTSIZE=2000
SAVEHIST=2000
setopt share_history
setopt inc_append_history
setopt hist_ignore_dups
setopt hist_reduce_blanks
setopt extended_history
setopt hist_find_no_dups
setopt hist_expire_dups_first

# load colors
autoload -U colors && colors

# Ctrl+arrow for word navigation
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word

# Zsh completion system
autoload -Uz compinit
compinit -d "${XDG_CACHE_HOME}/zsh/zcompdump-${ZSH_VERSION}"

# Completion styles
zstyle ':completion:*' menu select
zstyle ':completion::complete:*' gain-privileges 1

#Case-insensitive and partial-word completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Group completion by type
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '%F{yellow}%B%d%b%f'

# Cache expensive completions
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "${XDG_CACHE_HOME}/zsh/zcompcache"

# Up/down line search through command history
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
[[ -n "${key[Up]}"   ]] && bindkey -- "${key[Up]}"   up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search

# Syntax highlighting and autosuggestions
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=246" # required only: while using cyberdream theme in alacritty

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/p10k.zsh.
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
[[ -f "$XDG_CONFIG_HOME/zsh/.p10k.zsh" ]] && source "$XDG_CONFIG_HOME/zsh/.p10k.zsh"

# Enable Zsh color support
eval $(dircolors -b)

# Initialize Z (https://github.com/rupa/z)
[[ -f "$XDG_CONFIG_HOME/zsh/z.sh" ]] && . "$XDG_CONFIG_HOME/zsh/z.sh"

# Aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias wget="wget --hsts-file='$XDG_CACHE_HOME/wget-hsts'"

# GnuPG home
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export GPG_TTY=$(tty)

# Set default editor
export EDITOR=/usr/bin/nvim
export VISUAL=/usr/bin/nvim

# Java rule by antidot
export _JAVA_OPTIONS="-Djava.util.prefs.userRoot=$XDG_CONFIG_HOME/java"

# npm rule by antidot
export npm_config_cache="$XDG_CACHE_HOME/npm"
export NPM_CONFIG_USERCONFIG="$XDG_DATA_HOME/npm/npmrc"

# z rule by antidot
export _Z_DATA="$XDG_CACHE_HOME/z"

# go rule antidot
export GOPATH="$XDG_DATA_HOME/go"

# cargo_home rule antidot
export CARGO_HOME="$XDG_DATA_HOME/cargo"

# node_repl_history rule antidot
export NODE_REPL_HISTORY="$XDG_CACHE_HOME/node_repl_history"

# Python
export PYTHONSTARTUP="$XDG_CONFIG_HOME/python/pythnonrc.py"
export PYTHONPYCACHEPREFIX="$XDG_CACHE_HOME/python/__pycache__"

# Docker
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
export MACHINE_STORAGE_PATH="$XDG_DATA_HOME/docker-machine"

# Kubernetes
export KUBECONFIG="$XDG_CONFIG_HOME/kube/config"
###-begin-npm-completion-###
#
# npm command completion script
#
# Installation: npm completion >> ~/.bashrc  (or ~/.zshrc)
# Or, maybe: npm completion > /usr/local/etc/bash_completion.d/npm
#

if type complete &>/dev/null; then
  _npm_completion () {
    local words cword
    if type _get_comp_words_by_ref &>/dev/null; then
      _get_comp_words_by_ref -n = -n @ -n : -w words -i cword
    else
      cword="$COMP_CWORD"
      words=("${COMP_WORDS[@]}")
    fi

    local si="$IFS"
    if ! IFS=$'\n' COMPREPLY=($(COMP_CWORD="$cword" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           npm completion -- "${words[@]}" \
                           2>/dev/null)); then
      local ret=$?
      IFS="$si"
      return $ret
    fi
    IFS="$si"
    if type __ltrim_colon_completions &>/dev/null; then
      __ltrim_colon_completions "${words[cword]}"
    fi
  }
  complete -o default -F _npm_completion npm
elif type compdef &>/dev/null; then
  _npm_completion() {
    local si=$IFS
    compadd -- $(COMP_CWORD=$((CURRENT-1)) \
                 COMP_LINE=$BUFFER \
                 COMP_POINT=0 \
                 npm completion -- "${words[@]}" \
                 2>/dev/null)
    IFS=$si
  }
  compdef _npm_completion npm
elif type compctl &>/dev/null; then
  _npm_completion () {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    if ! IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                       COMP_LINE="$line" \
                       COMP_POINT="$point" \
                       npm completion -- "${words[@]}" \
                       2>/dev/null)); then

      local ret=$?
      IFS="$si"
      return $ret
    fi
    IFS="$si"
  }
  compctl -K _npm_completion npm
fi
###-end-npm-completion-###
