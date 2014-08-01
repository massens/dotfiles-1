# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="alanpeabody"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# VI keybindings:
#bindkey -v

# Customize to your needs...
PATH="/Applications/Postgres.app/Contents/Versions/9.3/bin:$PATH"
export PATH=$(brew --prefix ruby)/bin:$PATH     # For ruby gems
export PATH=/usr/local/bin:$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/git/bin:/usr/local/heroku/bin:/Users/aaron/.my_scripts:/usr/local/sbin

# Only auto-correct commands (not arguments):
unsetopt correct_all
setopt correct

# Directory traversal:
alias l='ls -alh'
alias ..='cd ..; ls'
alias ...='cd ../..; ls'

# Aliases for git:
alias gs='git status'
alias gl='git log'
alias gc='git checkout'
alias gb='git branch'
alias gr='git remote'
alias gpr='git pull --rebase'
alias t='tig --all'

# Commonly used tools:
alias p='python'
alias quickweb='python -c "import SimpleHTTPServer as a; a.test()"'
alias pypath='p -c "import sys, pprint; pprint.pprint(sys.path)"'

# Networking
alias httpsniff="sudo ngrep -W byline -d 'en0' -t '^(GET|POST) ' 'tcp and port 80'"
alias slownet="sudo ipfw pipe 1 config bw 100Kbit/s"
alias fastnet="sudo ipfw flush"
# For ipfw info see http://blog.tcs.de/simulate-slow-network-connection-on-mac-os-x/

# Reelhouse:
source $HOME/code/reelhouse/reelhouse_init.sh
export NODE_PATH=/usr/local/lib/node_modules

# NVM:
source ~/.nvm/nvm.sh

# fasd (https://github.com/clvv/fasd):
eval "$(fasd --init posix-alias zsh-hook)"
alias j='fasd_cd -d'     # jumping to autocompleted directory

# Allow bash-style comments in an interactive shell:
setopt interactivecomments

# Shorthand function to create a new project with a git repo and README:
function newproj () {
    mkdir $1
    cd $1
    git init
    touch README.md
    git add README.md
    git commit -m "First commit"
    echo "\nYour new project is ready. Make something awesome!"
}

# Script tmux to set up a window in my (currently) preferred custom layout:
function workspace () {
    # Main pane for vim on the left:
    tmux send-keys 'vim' 'C-m'
    tmux splitw -h -p 50

    # tig running in the bottom right:
    tmux splitw -v -p 30
    tmux send-keys 'tig --all' 'C-m'

    tmux select-pane -U
    tmux splitw -v -p 30
    tmux select-pane -L     # End up on the main (left) pane
}

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
