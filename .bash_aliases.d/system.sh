# Disk usage
alias df='df -PTh -x tmpfs -x devtmpfs -x squashfs -x overlay | column -t'
alias du='du -hx --max-depth=1'
alias free='free -m'

# System monitoring
alias top='htop'
alias meminfo='free -h'
alias cpuinfo='lscpu'
alias diskinfo='df -hT | column -t'
alias psme='ps -u $USER'

# Package management
alias apt='sudo apt'
alias updatedb='sudo updatedb'
alias uu="sudo apt-get update && sudo apt-get upgrade"
alias aac="sudo apt-get clean && sudo apt-get autoclean && sudo apt-get autoremove"

# Reload configuration
alias srca="source ~/.bash_aliases"
alias src="source ~/.bash_profile"
