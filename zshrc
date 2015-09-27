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

# Load tmux everytime a terminal is open
ZSH_TMUX_AUTOSTART=true

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git tmux)

# User configuration
source $ZSH/oh-my-zsh.sh

export MYVIMRC='~/.vimrc'
export MYNVIMRC='~/.nvimrc'

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

# vim key bindings
set -o vi

# Useful aliases
alias ls="ls --color -l"
alias zsh='vim ~/.zshrc'
alias vrc='vim ~/.vimrc'
alias nvrc='nvim ~/.nvimrc'

# With this set up, i can test changes i've made to Bundler by running dbundle,
# without interfering with the regular bundle command.
alias dbundle='ruby -I ~/projects/ruby/bundler/lib ~/.rvm/gems/ruby-2.2.1/gems/bundler-1.10.5/bin/bundle'

alias do_beta="ssh doc@104.131.96.105"
alias doclab="ssh ubuntu@52.2.239.20"

function restore_mongo()
{
  echo -n "DB name: "
  read db_name
  echo -n "Path of backup: "
  read backup
  mongorestore --db $db_name $backup
}

alias docapps="cd /var/www/apps"
alias docpro="cd ~/projects"
alias vi=vim
alias nv=nvim

# GO env
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/gocode
export PATH=$PATH:$HOME/gocode/bin

# Python env
export WORKON_HOME="$HOME/.virtualenvs"
#source /usr/local/bin/virtualenvwrapper.sh

# Java env
CLASSPATH=~/projects/galileo/cc4:.
CLASSPATH=/usr/local/lib/antlr-4.3-complete.jar:~/projects/Design_patterns:$CLASSPATH
alias antlr4='java -jar /usr/local/lib/antlr-4.3-complete.jar'
alias grun='java org.antlr.v4.runtime.misc.TestRig'

# Java bittorrent protocol implementation binaries
export CLASSPATH=$HOME/projects/java/ttorrent/cli/target/ttorrent-cli-1.5-SNAPSHOT-shaded.jar:$CLASSPATH
alias ttorrent="java -jar $HOME/projects/java/ttorrent/cli/target/ttorrent-cli-1.5-SNAPSHOT-shaded.jar"
#PATH=$PATH:$HOME/projects/java/ttorrent/bin

# NVM
export NVM_HOME="$HOME/.nvm"
if [[ -f "$NVM_HOME/nvm.sh" ]]; then
  source "$NVM_HOME/nvm.sh"
fi

# Add local bin to path, need this for tmux status-line
if [ -d "$HOME/.local/bin" ]; then
    PATH="$HOME/.local/bin:$PATH"
fi

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
