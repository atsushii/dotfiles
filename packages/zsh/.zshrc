# Init Starship
eval "$(starship init zsh)"
# Customize to your needs...
# export PATH=$HOME/bin:/usr/local/bin:$PATH

alias code="open -a 'Visual Studio Code'"
alias ll="ls -l"
alias g="git"
alias tf="terraform"
alias k="kubectl"
alias d="docker"

. /usr/local/opt/asdf/libexec/asdf.sh

source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
