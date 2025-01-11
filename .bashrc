# ~/.bashrc: executed by bash(1) for non-login shells.

# Load bash completion if not already loaded
if [ -f /etc/profile.d/bash_completion.sh ]; then
    source /etc/profile.d/bash_completion.sh
fi

# If not running interactively, exit
case $- in
    *i*) ;;
    *) return;;
esac

# History settings
HISTCONTROL=ignoreboth
HISTSIZE=10000
HISTFILESIZE=20000
shopt -s histappend

# Include timestamps in history
HISTTIMEFORMAT="%F %T "

# Ignore duplicate commands in history
export HISTCONTROL=ignoredups:erasedups

# Check and adjust window size
shopt -s checkwinsize

# Set chroot info for the prompt
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Prompt configuration
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

if [ -n "$force_color_prompt" ] && [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    color_prompt=yes
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# Set terminal title
case "$TERM" in
    xterm*|rxvt*)
        PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
        ;;
esac

# Enable color support for commands
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Useful environment variables
export PATH="$PATH:/home/lappy/.cache/lm-studio/bin"
export PATH="$PATH:/home/lappy/.local/bin"
export PATH="$PATH:$HOME/.dotnet:$HOME/.dotnet/tools"
export DOTNET_ROOT="$HOME/.dotnet"
export PAGER="most"

# Enable programmable completion
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

# Load Node Version Manager (nvm)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Brew environment
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Android SDK and NDK Paths
export ANDROID_HOME="$HOME/Android/Sdk"
export PATH="$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools:$PATH"
export ANDROID_NDK_HOME="$ANDROID_HOME/ndk-bundle"
export PATH="$ANDROID_NDK_HOME:$PATH"

# Flutter Path
export PATH="$PATH:$HOME/flutter/bin"

# Custom Scripts
function apk_info() {
    aapt dump badging "$1" | grep -E "package|launchable-activity"
}

function weather() {
    curl "wttr.in/$1"
}

# Fixed function definitions
function c2f() {
    echo "$1 * 1.8 + 32" | bc
}

function f1spd() {
    echo "$1 * 0.621371" | bc
}

# Android-related aliases
alias install-apk='adb install -r app/build/outputs/apk/debug/app-debug.apk'
alias android-clean='find . -name build -type d -exec rm -rf {} +'
alias start-emulator='(emulator @YOUR_AVD_NAME &) && sleep 5 && adb logcat'

# Graceful exit
export EDITOR=nano
export VISUAL=nano

# Load aliases from individual files
if [ -d "$HOME/.bash_aliases.d" ]; then
    for file in "$HOME/.bash_aliases.d/"*.sh; do
        [ -r "$file" ] && . "$file"
    done
    unset file
fi
