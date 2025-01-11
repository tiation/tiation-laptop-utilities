# Git shortcuts
alias gs='git status'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push'
alias gl='git pull'
alias gb='git branch'
alias gco='git checkout'
alias gd='git diff'
alias gcm='git checkout main'

# Docker shortcuts
alias dps='docker ps'
alias di='docker images'
alias dstop='docker stop $(docker ps -q)'
alias drm='docker rm $(docker ps -aq)'
alias drmi='docker rmi $(docker images -q)'

# Python virtual environments
alias venv='python3 -m venv .venv && source .venv/bin/activate'

# Node/npm shortcuts
alias npm-install='npm install'
alias npm-build='npm run build'
alias npm-start='npm start'
