# Enable Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to oh-my-zsh installation
export ZSH="$HOME/.oh-my-zsh"

# Theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# Plugins
plugins=(git zsh-syntax-highlighting zsh-autosuggestions fzf)

source $ZSH/oh-my-zsh.sh

# User configuration
export EDITOR='nvim'
export VISUAL='nvim'
export TERM="xterm-kitty"
# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Tmuxifier
export PATH="$HOME/.config/.tmuxifier/bin:$PATH"
eval "$(tmuxifier init -)"

# Powerlevel10k
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Google Cloud SDK
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/google-cloud-sdk/path.zsh.inc"; fi
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/google-cloud-sdk/completion.zsh.inc"; fi

# Custom Functions
fzf_open() {
  local file
  file=$(find . -type f -not -path '*/\.*' | fzf +m -q "$1")
  if [[ -n "$file" ]]; then
    nohup xdg-open "$file" >/dev/null 2>&1 &
    disown
  fi
}

# Aliases
alias fo='fzf_open'
alias zshrc='nvim ~/.zshrc'
alias vimrc='cd .config/nvim && nvim .'
alias tmuxrc='cd .config/tmux && nvim .'
alias update='sudo pacman -Syu'  # Assuming you're using Arch-based distro
alias ls='exa --icons'
alias ll='exa -alh --git --icons'
alias tree='exa --tree --icons'
alias cat='bat'  # Remember to install bat
alias vim='nvim'

# Git aliases
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git log --oneline --graph --decorate'

# Tmux aliases
alias tn='tmux new -s'
alias ta='tmux attach -t'
alias tl='tmux list-sessions'
alias op='tmuxifier load-session test'
alias ds='tmuxifier load-session dsa'
alias dsa="cd ~/Documents/Week-13-Web-Development/git/basic_dsa_sheet/javascript && vim ."
# alias ds='code ~/JS_DSA_Learning/prime '
# DB aliases
alias db='sudo systemctl start mongodb'
alias dbs='sudo systemctl stop mongodb'
alias wo='cd Projects'
# Dotfiles alias
alias dotfiles='/usr/bin/git --git-dir=/home/dude/.dotfiles/ --work-tree=/home/dude'

# Start SSH agent (moved to the end)
if [ -z "$SSH_AUTH_SOCK" ] ; then
  eval "$(ssh-agent -s)" &>/dev/null
  ssh-add ~/.ssh/id_ed25519 &>/dev/null
fi

# bun completions
[ -s "/home/dude/.bun/_bun" ] && source "/home/dude/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
