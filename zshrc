# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

source $HOME/.global
source $HOME/.secret

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Load tmux everytime a terminal is open
ZSH_TMUX_AUTOSTART=true
ZSH_TMUX_AUTOQUIT=false
ZSH_TMUX_AUTOCONNECT=false

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git tmux)

# User configuration
source $ZSH/oh-my-zsh.sh

export MYVIMRC="~/.vimrc"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR="vim"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# vim key bindings
set -o vi

# Useful aliases
alias ls="ls -G -l"
alias vi="vim"
alias vrc="vi ~/.vimrc"
alias zshrc="vi ~/.zshrc"

# Test changes you've made to Bundler by running dbundle, without interfering with the regular bundle command.
alias dbundle="ruby -I $HOME/projects/ruby/bundler/lib $HOME/projects/ruby/bundler/exe/bundle"

# Test changes you've made to Rubygems by running dgem, without interfering with the regular gem command.
alias dgem="ruby -I $HOME/projects/rubygems/lib $HOME/projects/rubygems/bin/gem"

# irc cliet
alias irc=irssi

# Alias for Colorized cat
alias cc=ccat

# Docker utilities
function clean_images()
{
  docker rmi -f $(docker images | grep '^<none>' | awk '{print $3}')
}

function clean_containers()
{
  docker rm $(docker ps -aq)
}

# Search
bindkey '^R' history-incremental-search-backward

function restore_mongo()
{
  echo -n "DB name: "
  read db_name
  echo -n "Path of backup: "
  read backup
  mongorestore --db $db_name $backup
}

# Put brew in path
export PATH="$HOME/.linuxbrew/bin:$PATH"

# Do NOT autoupdate when:
# brew install
# brew tap
# brew update
export HOMEBREW_NO_AUTO_UPDATE=1

# GO environment
export GOPATH=$HOME/gocode
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/usr/local/go/bin

export PKG_CONFIG_PATH="/usr/lib/x86_64-linux-gnu/pkgconfig:$PKG_CONFIG_PATH"

eval "$(rbenv init -)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH="/usr/local/opt/qt@5.5/bin:$PATH"
export PATH="$HOME/Qt5.5.0/5.5/clang_64/bin:$PATH"
