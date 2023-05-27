# Automatically cd into typed directory
setopt autocd

# Default program.
export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="firefox"
export AUR_HELPER="paru"

# Some default config directories
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# QT5CT
export QT_QPA_PLATFORMTHEME=qt5ct

# History control
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history
HISTORY_IGNORE="(ls|cd|pwd|la|ll|frepo|faur|fb|cl|cd ..)"

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
# Include hidden files in autocomplete:
_comp_options+=(globdots)

# Load ZSH plugins
PLUGINS_DIR="/usr/share/zsh/plugins"

source $PLUGINS_DIR/zsh-autosuggestions/zsh-autosuggestions.zsh 2> /dev/null
source $PLUGINS_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2> /dev/null
source $PLUGINS_DIR/zsh-vim-mode/zsh-vim-mode.plugin.zsh 2> /dev/null
source $PLUGINS_DIR/zsh-system-clipboard/zsh-system-clipboard.zsh 2> /dev/null

# Make zsh switch from insert mode to normal mode quicker
export KEYTIMEOUT=1

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#6e6e6e"
MODE_CURSOR_VIINS="#00ff00 blinking bar"
MODE_CURSOR_REPLACE="$MODE_CURSOR_VIINS #ff0000"
MODE_CURSOR_VICMD="green block"
MODE_CURSOR_SEARCH="#ff00ff steady underline"
MODE_CURSOR_VISUAL="$MODE_CURSOR_VICMD steady block"
MODE_CURSOR_VLINE="$MODE_CURSOR_VISUAL #00ffff"

# Alias
alias \
    ls="ls --color" \
    lla="ls -labg" \
    la="ls -a" \
    lt="ls -T" \
    ll="ls -lbg" \
    aria2-m6="aria2c --max-download-limit=6M" \
    grep="grep --color=auto" \
    diff="diff --color=auto" \
    cl="clear" \
    snvim="sudoedit" \

# Enabling Portage completions and Gentoo prompt for zsh
autoload -U compinit promptinit
compinit
promptinit; prompt gentoo

##### starship command to print prompt
eval "$(starship init zsh)" 2> /dev/null
