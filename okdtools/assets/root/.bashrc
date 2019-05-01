# .bashrc

# Source global definitions
if [ -f /etc/profile ]; then
	. /etc/profile
fi

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Setting SHELL variable if undefined, required for serverless auto-complete
# based on 'tabtab'
[ -z "$SHELL" ] && export SHELL=$(which bash)

# Path to GoLang binaries, packages, sources...
export GOPATH=$WORKDIR/go

# Adding custom paths
export PATH=${PATH}:$GOPATH/bin

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
# force grep to alway colorize output
#alias grep='grep --color=always'
# force less to render colorized inputs
alias less='less -R'

# Load auto-complete
[ -f $HOME/.autocomplete.bash ] && . $HOME/.autocomplete.bash

if [ -d $HOME/.autocomplete ]; then
  for f in $(ls $HOME/.autocomplete/*); do
    . $f
  done
fi
