# XDG Base Directory specification
export XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
export XDG_STATE_HOME=${XDG_STATE_HOME:-$HOME/.local/state}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:-$HOME/.cache}

# Powerlevel10k instant prompt (speed up Zsh startup)
if [[ -r "${XDG_CACHE_HOME}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Zsh history settings
export HISTFILE="$XDG_STATE_HOME/zsh/histfile"
HISTSIZE=1000
SAVEHIST=1000
setopt share_history  # Share history across terminals

# Vi-mode for Zsh
bindkey -v

# Zsh completion system
autoload -Uz compinit
compinit -d "${XDG_CACHE_HOME}/zsh/zcompdump-${ZSH_VERSION}"

# Completion styles
zstyle ':completion:*' menu select
zstyle ':completion::complete:*' gain-privileges 1

# Up/down line search through command history
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
[[ -n "${key[Up]}"   ]] && bindkey -- "${key[Up]}"   up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search

# Syntax highlighting and autosuggestions
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Powerlevel10k theme
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
[[ -f "$XDG_CONFIG_HOME/zsh/p10k.zsh" ]] && source "$XDG_CONFIG_HOME/zsh/p10k.zsh"

# GnuPG home
export GNUPGHOME="$XDG_DATA_HOME/gnupg"

# Wget alias to save HSTS data in the XDG data directory
alias wget='wget --hsts-file="$XDG_DATA_HOME/wget-hsts"'

# Set default editor
export EDITOR=/usr/bin/nvim
export VISUAL=/usr/bin/nvim

# Initialize Z (https://github.com/rupa/z)
[[ -f "$XDG_CONFIG_HOME/zsh/z.sh" ]] && . "$XDG_CONFIG_HOME/zsh/z.sh"

# Java rule by antidot
export _JAVA_OPTIONS="-Djava.util.prefs.userRoot=$XDG_CONFIG_HOME/java"

# npm rule by antidot
export npm_config_cache="$XDG_CACHE_HOME/npm"

# z rule by antidot
export _Z_DATA="$XDG_CACHE_HOME/z"

# go rule antidot
export GOPATH="$XDG_DATA_HOME/go"
