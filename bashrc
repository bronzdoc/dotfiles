#!usr/bin/env bash

source "/home/lsagastume/.rvm/scripts/rvm"

alias tmux="tmux -2"

alias ls="ls --color -l"
alias gits="git status"
alias mongo_prod='mongo -u ayalo -p cu3teVentures! ds055670-a0.mongolab.com:55670/ayalo_production'
# alias mongo_beta='mongo -u heroku_app12791487 -p e80vhlnjnh0s9jo2n2sqcq33j9 ds049858.mongolab.com:49858/beta_ayalo'
alias mongo_beta='mongo -u ayalo -p cu3teVentures! ds029827.mongolab.com:29827/ayalo_staging'

alias dump_mongo_prod="mongodump --host ds055670-a0.mongolab.com --db ayalo_production --username ayalo --port 55670 --password cu3teVentures! --out mongo_backup-$(date +%m-%d-%Y)"
alias cuete='ssh ubuntu@54.225.110.25'

alias postgres_server='ssh ubuntu@54.225.139.118'
alias dump_postgres_prod="pg_dump -h ec2-54-243-136-95.compute-1.amazonaws.com -U u3rcmorpvbt9kn -p 5492 > pg-$(date +%m-%d-%Y).out"

alias pospro="psql -h ec2-54-243-136-95.compute-1.amazonaws.com -U u3rcmorpvbt9kn -p 5492 d9463q9lg5lbl2"
alias posbeta="psql -h sebastiangodoy.com -U postgres -p 5432 ayalo_dev"

alias docapps="cd /var/www/apps"
alias docpro="cd ~/projects"

# vim key bindings
set -o vi

# This to show git branch as part of the $PS1 variable
# curl https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh > ~/.bash_git
source ~/.bash_git

# Java shit
CLASSPATH=~/projects/galileo/cc4:.
export CLASSPATH=/usr/local/lib/antlr-4.3-complete.jar:~/projects/Design_patterns:$CLASSPATH
alias antlr4='java -jar /usr/local/lib/antlr-4.3-complete.jar'
alias grun='java org.antlr.v4.runtime.misc.TestRig'

#✪
#→
#◎

# In order for this to work, color sequences must be enclosed with brackets. Example: \[\e[1;33\] \[\e[m\] instead of \e[1;33 \e[m
export PS1='\[\e[1;35m\](⚡)\[ \e[m\]\[\e[1;0m\]\u\[\e[m\]\[\e[0;30m@\]\[\e[m\]\[\e[1;32m\]\h\[\e[m\]\[\e[0;0m\]:\[\e[m\]\[\e[1;36m\][\w]\[\e[0;34\]m$( __git_ps1 " (%s) ")\[\e[m\]\[\e[m\]\[\e[1;33m\]\$\[\e[m\]\n\[\e[0;31m\]  (∙》\[\e[m\]'

# Set solarized theme colors for terminal
eval `dircolors ~/.dircolors`

# Make vim background transparent
# export TERM=xterm-256color

#NVM
export NVM_HOME="$HOME/.nvm"
if [[ -f "$NVM_HOME/nvm.sh" ]]; then
  source "$NVM_HOME/nvm.sh"
fi

# Start tmux everytime a terminal is open
tmux

