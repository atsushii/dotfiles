#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
export PATH=$HOME/bin:/usr/local/bin:$PATH

alias code="open -a 'Visual Studio Code'"
alias ll="ls -l"
alias g="git"

. /usr/local/opt/asdf/asdf.sh