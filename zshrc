# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

#Load rvm
#source "/home/lsagastume/.rvm/scripts/rvm"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

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

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

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

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration

export MYVIMRC='~/.vimrc'

export PATH="/home/lsagastume/.rvm/gems/ruby-1.9.3-p484/bin:/home/lsagastume/.rvm/gems/ruby-1.9.3-p484@global/bin:/home/lsagastume/.rvm/rubies/ruby-1.9.3-p484/bin:/home/lsagastume/.rvm/bin:/home/lsagastume/.local/bin:/home/lsagastume/.nvm/v0.10.33/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# vim key bindings
set -o vi

# Useful aliases
alias ls="ls --color -l"
alias mongo_prod='mongo -u ayalo -p cu3teVentures! ds055670-a0.mongolab.com:55670/ayalo_production'
alias zsh='vi ~/.zshrc'
alias vrc='vi ~/.vimrc'

# alias mongo_beta='mongo -u heroku_app12791487 -p e80vhlnjnh0s9jo2n2sqcq33j9 ds049858.mongolab.com:49858/beta_ayalo'
alias mongo_beta='mongo -u ayalo -p cu3teVentures! ds029827.mongolab.com:29827/ayalo_staging'

alias dump_mongo_prod="mongodump --host ds055670-a0.mongolab.com --db ayalo_production --username ayalo --port 55670 --password cu3teVentures! --out mongo_backup-$(date +%m-%d-%Y)"
function restore_mongo()
{
  echo -n "DB name: "
  read db_name
  echo -n "Path of backup: "
  read backup
  mongorestore --db $db_name $backup
}

alias cuete='ssh ubuntu@54.225.110.25'
alias ayalo='ssh ubuntu@ayalo.co'
alias sms_server='ssh ubuntu@54.208.130.7'

alias postgres_server='ssh ubuntu@54.225.139.118'
alias dump_postgres_prod="pg_dump -h ec2-54-243-136-95.compute-1.amazonaws.com -U u3rcmorpvbt9kn -d d9463q9lg5lbl2 -p 5492  > pg-$(date +%m-%d-%Y).out"

# Dump productions postgres and restore it locally
function restore_postgres_local()
{
 url=`heroku pgbackups:url --app fast-wave-4205`
 wget -O pg.dump $url
 psql -U postgres <<< 'DROP DATABASE ayalo_dev'
 psql -U postgres <<< 'CREATE DATABASE ayalo_dev'
 pg_restore -U postgres -Od ayalo_dev pg.dump
}

alias pospro="psql -h ec2-54-243-136-95.compute-1.amazonaws.com -U u3rcmorpvbt9kn -p 5492 d9463q9lg5lbl2"
alias posbeta="psql -h sebastiangodoy.com -U ayalo -p 5432 ayalo_dev"
alias posdev="psql ayalo_dev postgres"

alias docapps="cd /var/www/apps"
alias docpro="cd ~/projects"
alias vi=vim

# GO env
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# Python env
export WORKON_HOME="$HOME/.virtualenvs"
source /usr/local/bin/virtualenvwrapper.sh

# Java env
CLASSPATH=~/projects/galileo/cc4:.
export CLASSPATH=/usr/local/lib/antlr-4.3-complete.jar:~/projects/Design_patterns:$CLASSPATH
alias antlr4='java -jar /usr/local/lib/antlr-4.3-complete.jar'
alias grun='java org.antlr.v4.runtime.misc.TestRig'

# NVM
export NVM_HOME="$HOME/.nvm"
if [[ -f "$NVM_HOME/nvm.sh" ]]; then
  source "$NVM_HOME/nvm.sh"
fi

# Set solarized theme colors for terminal
eval `dircolors ~/.dircolors`

# export TERM=xterm-256color

# Start tmux everytime a terminal is open
alias tmux="tmux -2"
# tmux

