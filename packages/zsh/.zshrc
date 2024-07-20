# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
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
eval "$(direnv hook zsh)"

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

export PATH="/usr/local/bin/git:$PATH"

. /usr/local/opt/asdf/libexec/asdf.sh

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/miyamotoatsushi/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/miyamotoatsushi/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/miyamotoatsushi/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/miyamotoatsushi/google-cloud-sdk/completion.zsh.inc'; fi

# bun completions
[ -s "/Users/miyamotoatsushi/.bun/_bun" ] && source "/Users/miyamotoatsushi/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# 署名
export GPG_TTY=$TTY
