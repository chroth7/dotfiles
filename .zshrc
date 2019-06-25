# Startup perf: https://blog.askesis.pl/post/2017/04/how-to-debug-zsh-startup-time.html

# zmodload zsh/zprof

export ZSH=$HOME/.oh-my-zsh
export MYZSH=$HOME/.zsh
export TERM="xterm-256color"

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# Add env.sh
# source ~/Projects/config/env.sh

# ZSH_THEME=agnoster
ZSH_THEME="powerlevel9k/powerlevel9k"

plugins=(git colored-man colorize github vi-mode brew osx zsh-syntax-highlighting kubectl)

source $ZSH/oh-my-zsh.sh
source $MYZSH/tmux 

export ANDROID_HOME=~/Library/Android/sdk
export PATH="$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools:$(brew --prefix curl)/bin:$HOME/.jenv/bin:$HOME/miniconda3/bin:$PATH"
# Too slow...
# eval "$(jenv init -)"

export PATH=$PATH:~/.local/bin
export PATH="$HOME/.yarn/bin:$PATH"
export PATH=$PATH:~/Library/Python/3.7/bin

vman() {
  vim -c "SuperMan $*"

  if [ "$?" != "0" ]; then
    echo "No manual entry for $*"
  fi
}

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/christianroth/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/christianroth/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/christianroth/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/christianroth/google-cloud-sdk/completion.zsh.inc'; fi

if [[ -e /usr/libexec/java_home ]]; then
  export JAVA_HOME=`/usr/libexec/java_home`
fi
export PATH=$JAVA_HOME/bin:$PATH
export PATH=$PATH:/opt/apache-maven/bin

# MY OWN ALIASES
export EDITOR=vim

alias dotv="vim ~/.vimrc"
alias srcv="source ~/.vimrc"
alias dotz="vim ~/.zshrc"
alias srcz="source ~/.zshrc"
alias v="vim"
alias glcoud="gcloud"

# MY GIT
alias gpd="git checkout develop && git pull"
alias gpm="git checkout master && git pull"

# Spotify
alias play="spotify play"
alias pause="spotify pause"

# cbt
alias cbttlabs='echo "project = tlabs-123\ninstance = tlabs-bigtable" >! ~/.cbtrc'
alias cbtranger='echo "project = t2-prod\ninstance = ranger-bigtable" >! ~/.cbtrc'

# Global alias, expanded anywhere >> Use: ls -l G foo
alias -g G='| grep -i'

# Suffix alias, will automatically exec a program
# Use like: `something.yml` > will auto open vim for it
alias -s {yml,yaml,json,js,ts,xml}=vim

function f() { find . -iname "*$1*" ${@:2} }
function r() { grep "$1" ${@:2} -R . }
function clip() { cat "$1" | pbcopy }

function mkcd() { mkdir -p "$@" && cd "$_"; }

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(user dir vcs vi_mode)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs history time)

bindkey -v

# zprof
