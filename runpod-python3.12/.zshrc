# Path to oh-my-zsh installation
export ZSH="$HOME/.oh-my-zsh"

# Theme
ZSH_THEME="robbyrussell"

# Plugins
# plugins=(
#     git
#     docker
#     kubectl
#     python
#     pip
#     colored-man-pages
#     command-not-found
#     zsh-autosuggestions
#     zsh-syntax-highlighting
# )
plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# suggested by claude code
# User configuration
# export LANG=en_US.UTF-8
# export EDITOR='vim'

# Custom aliases
# alias ll='ls -alF'
# alias la='ls -A'
# alias l='ls -CF'
# alias ..='cd ..'
# alias ...='cd ../..'
# alias gs='git status'
# alias ga='git add'
# alias gc='git commit'
# alias gp='git push'
# alias gl='git log --oneline --graph --decorate'
# alias gd='git diff'
# alias python='python3'
# alias pip='pip3'

# Docker aliases
# alias dps='docker ps'
# alias di='docker images'
# alias dex='docker exec -it'

# Custom functions
# mkcd() {
#     mkdir -p "$1" && cd "$1"
# }

# # Jupyter shortcuts
# alias jn='jupyter notebook --ip=0.0.0.0 --no-browser --allow-root'
# alias jl='jupyter lab --ip=0.0.0.0 --no-browser --allow-root'

# # GPU monitoring
# alias gpus='watch -n 1 nvidia-smi'

# # History configuration
# HISTSIZE=10000
# SAVEHIST=10000
# setopt SHARE_HISTORY
# setopt HIST_IGNORE_DUPS
# setopt HIST_IGNORE_SPACE

# # Enable auto-cd (type directory name to cd into it)
# setopt AUTO_CD

# # Custom prompt with git info
# autoload -Uz vcs_info
# precmd() { vcs_info }
# zstyle ':vcs_info:git:*' formats ' (%b)'
# setopt PROMPT_SUBST
# PROMPT='%F{cyan}%n@%m%f:%F{green}%~%f%F{yellow}${vcs_info_msg_0_}%f$ '

export UV_CACHE_DIR=/workspace/.uv_cache

alias gvv='git branch -vv'
alias gcne='GIT_COMMITTER_DATE="$(date)" git commit --amend --no-edit --date "$(date)"'
alias gce='GIT_COMMITTER_DATE="$(date)" git commit --amend --date "$(date)"'
alias glog='git log --oneline'

bindkey '\e[1;3D' backward-word
bindkey '\e[1;3C' forward-word
