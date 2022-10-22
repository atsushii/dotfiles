# Init Starship
eval "$(starship init zsh)"
# Customize to your needs...
# export PATH=$HOME/bin:/usr/local/bin:$PATH

alias code="open -a 'Visual Studio Code'"
alias g="git"
alias tf="terraform"
alias k="kubectl"
alias d="docker"
alias ls="exa --icons"
alias ll='exa -ahl --git'
alias tree="exa -T --git-ignore"
alias cat="bat"
alias find="fd"

. /usr/local/opt/asdf/libexec/asdf.sh

source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
eval "$(pyenv init -)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/miyamotoatsushi/.pyenv/versions/anaconda3-2019.10/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/miyamotoatsushi/.pyenv/versions/anaconda3-2019.10/etc/profile.d/conda.sh" ]; then
        . "/Users/miyamotoatsushi/.pyenv/versions/anaconda3-2019.10/etc/profile.d/conda.sh"
    else
        export PATH="/Users/miyamotoatsushi/.pyenv/versions/anaconda3-2019.10/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# fzf
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix | fzf'

# fd - cd to selected directory
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}
# fh - repeat history
fh() {
  eval $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed -E 's/ *[0-9]*\*? *//' | sed -E 's/\\/\\\\/g')
}
# fbr - checkout git branch
fbr() {
  local branches branch
  branches=$(git --no-pager branch -vv) &&
  branch=$(echo "$branches" | fzf +m) &&
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}
