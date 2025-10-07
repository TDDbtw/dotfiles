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
# source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
source ~/.oh-my-zsh/custom/themes/powerlevel10k/powerlevel10k.zsh-theme
   

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# # Google Cloud SDK
# if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/google-cloud-sdk/path.zsh.inc"; fi
# if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/google-cloud-sdk/completion.zsh.inc"; fi

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
alias cdir='cd "${_%/*}"'
alias vimrc='cd .config/nvim && nvim .'
alias hrc='cd .config/hypr && nvim .'
alias tmuxrc='cd .config/tmux && nvim .'
alias i3rc='cd .config/i3 && nvim .'
alias picomrc='nvim .config/i3/picom.conf'
alias update='sudo pacman -Syu'  # Assuming you're using Arch-based distro
alias X='sudo shutdown -h now'
alias R='reboot'
alias D='sudo systemctl restart display-manager'
alias T='sudo shutdown -h'
alias V='wayvnc 0.0.0.0 5900 --output HDMI-A-1 --render-cursor'
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
alias d='tmuxifier load-session d3'
alias ce='tmuxifier load-session ce'
alias in='tmuxifier load-session intake'
alias fd='tmuxifier load-session fd'
alias f='tmuxifier load-session FullD'
alias re='tmuxifier load-session ts'
alias nr='tmuxifier load-session nr'
alias rd='tmuxifier load-session rd'


# alias ds='code ~/JS_DSA_Learning/prime '
# DB aliases
alias db='sudo systemctl start mongodb'
alias pg='sudo -u postgres psql'
alias dbs='sudo systemctl stop mongodb'
alias pr='cd Projects'
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
export PATH=~/.npm-global/bin:$PATH

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
