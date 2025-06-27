# Path to your oh-my-zsh installation.
export ZSH=/home/jredmerski/.oh-my-zsh

export TERM="xterm-256color"

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="half-life"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git vi-mode zsh-256color zsh-completions zsh-autosuggestions)

autoload -U compinit && compinit

# User configuration

source $ZSH/oh-my-zsh.sh

PROMPT='%{$fg[cyan]%}%* '$PROMPT

autoload zkbd
[[ ! -f ${ZDOTDIR:-$HOME}/.zkbd/$TERM-$DISPLAY ]] && zkbd
source ${ZDOTDIR:-$HOME}/.zkbd/$TERM-$DISPLAY

[[ -n ${key[Backspace]} ]] && bindkey "${key[Backspace]}" backward-delete-char
[[ -n ${key[Insert]} ]] && bindkey "${key[Insert]}" overwrite-mode
[[ -n ${key[Home]} ]] && bindkey "${key[Home]}" beginning-of-line
[[ -n ${key[PageUp]} ]] && bindkey "${key[PageUp]}" up-line-or-history
[[ -n ${key[Delete]} ]] && bindkey "${key[Delete]}" delete-char
[[ -n ${key[End]} ]] && bindkey "${key[End]}" end-of-line
[[ -n ${key[PageDown]} ]] && bindkey "${key[PageDown]}" down-line-or-history
[[ -n ${key[Up]} ]] && bindkey "${key[Up]}" up-line-or-search
[[ -n ${key[Left]} ]] && bindkey "${key[Left]}" backward-char
[[ -n ${key[Down]} ]] && bindkey "${key[Down]}" down-line-or-search
[[ -n ${key[Right]} ]] && bindkey "${key[Right]}" forward-char

alias vim='nvim'
#
alias lsn="ls -l | awk '{k=0;for(i=0;i<=8;i++)k+=((substr(\$1,i+2,1)~/[rwx]/) \
             *2^(8-i));if(k)printf(\"%0o \",k);print}'"
# (for zsh-autosuggestions)
bindkey '^@' autosuggest-accept

# for people wanting to use ranger - makes the current directory stay on exit back to shell
alias ranger=". ranger"
alias tmuxcp="tmux show-buffer | wl-copy"
# makes nvim the default editor
export EDITOR=/usr/bin/nvim
export VISUAL=/usr/bin/nvim

# tools
export PATH=$PATH:~/tools/bin

# tools
export PATH=$PATH:~/.local/bin

if [ -e ~/.nix-profile/etc/profile.d/nix.sh ]; then
  source ~/.nix-profile/etc/profile.d/nix.sh
fi

#auto start ssh
if [ -z "$SSH_AUTH_SOCK" ] && [ -x "$(command -v ssh-agent)" ]; then
  eval "$(ssh-agent -s)"
  ssh-add ~/.ssh/id_ed25519
fi
# aliases
alias bashly='docker run --rm -it --user $(id -u):$(id -g) --volume "$PWD:/app" dannyben/bashly'
alias penv="cd ~/git/open-source-firmware-validation ;python3 -m virtualenv venv && source venv/bin/activate && pip install -r ./requirements.txt"
alias mypenv="git submodule update --init --checkout;virtualenv -p $(which python3) robot-venv;source robot-venv/bin/activate;pip install -U -r requirements.txt"
alias gogit="cd ~/git"
#my very own aliases
alias l="ls -tr"
alias la="ls -altr"
alias ll="ls -ltr"
alias ld="ls -d */"
alias u="cd .." #up
alias h="cd ~/" #home
alias CD="cd"
alias i="hostname; whoami; pwd"
alias showLogs="firefox /home/$USER/git/open-source-firmware-validation/output.xml; firefox /home/$USER/git/open-source-firmware-validation/log.html; firefox /home/$USER/git/open-source-firmware-validation/report.html"
alias comConnect="minicom -b 115200 -D /dev/ttyUSB0 -c on"
alias te="gnome-text-editor"
alias vc="cd ~/git; source venv_cli/bin/activate; cd osfv-scripts"
alias vt="cd ~/git; source venv_cli/bin/activate; cd osfv-scripts"
alias sshConf="ssh-add ~/.ssh/id_ed25519"
alias govm="ssh jredmerski@192.168.4.110"
alias hs="history | grep "
alias runQemu="~/git/open-source-firmware-validation/scripts/ci/qemu-run.sh graphic "
alias precom="pre-commit run --all-files"
alias vmnfs="sudo mount -t nfs 192.168.4.110:/srv/nfs/logs /var/nfs/osfv"
alias gonfs=cd /var/nfs/osfv/releases/
