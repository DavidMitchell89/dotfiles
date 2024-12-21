ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

export EDITOR=nvim

# load Powerlevel10K
# zinit ice depth=1; zinit light romkatv/powerlevel10k

#init oh my posh
eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/tokyonight.toml)"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux 

# autoload completions
autoload -Uz compinit && compinit

zinit cdreplay -q

autoload -U colors && colors
bindkey -v

# History
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/pickle/.zshrc'


eval "$(zoxide init zsh)"
eval "$(fzf --zsh)"

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ll='ls --color=auto -alhF'
alias yeet='sudo pacman -Rns'
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
