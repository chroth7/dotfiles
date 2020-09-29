# Startup perf: https://blog.askesis.pl/post/2017/04/how-to-debug-zsh-startup-time.html

# zmodload zsh/zprof

export LC_ALL=en_US.UTF-8
export ZSH=$HOME/.oh-my-zsh
export MYZSH=$HOME/.zsh
export TERM="xterm-256color"

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# ghc
source $HOME/.ghcup/env

# Customize to your needs...

# Add env.sh
# source ~/Projects/config/env.sh
#

# Search in history
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "$terminfo[kcuu1]" up-line-or-beginning-search # Up
bindkey "$terminfo[kcud1]" down-line-or-beginning-search # Down

# ZSH_THEME=agnoster
ZSH_THEME="powerlevel9k/powerlevel9k"

plugins=(git github vi-mode brew osx kubectl docker terraform kube-ps1)

source $ZSH/oh-my-zsh.sh

export ANDROID_HOME=~/Library/Android/sdk
export PATH="$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools:$(brew --prefix curl)/bin:$HOME/.jenv/bin:$HOME/miniconda3/bin:$PATH"

export SPARK_HOME=$HOME/spark3p2
export PATH=$SPARK_HOME:$SPARK_HOME/bin:$SPARK_HOME/sbin:$PATH

# Too slow...
# eval "$(jenv init -)"

eval $(thefuck --alias)

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
export EDITOR=nvim
alias cow='npx -q https://gist.github.com/chroth7/5dbac65a10075027adc7ad337b340952'

source ~/dotfiles/aliases/docker.zsh
source ~/dotfiles/aliases/mongodb.zsh
source ~/dotfiles/aliases/tmux.zsh
source ~/dotfiles/aliases/generalAliases.zsh
source ~/dotfiles/aliases/npm.zsh
source ~/dotfiles/aliases/git.zsh
source ~/dotfiles/aliases/spotify.zsh
source ~/dotfiles/aliases/cbt.zsh
source ~/dotfiles/aliases/terraform.zsh
source ~/dotfiles/aliases/fluentd.zsh
source ~/dotfiles/aliases/kube.zsh
source ~/dotfiles/aliases/prettier.zsh

# Global alias, expanded anywhere >> Use: ls -l G foo
alias -g G='| grep -i'
alias -g onecell=' cells-per-column=1'
alias -g allns=' --all-namespaces'

# Suffix alias, will automatically exec a program
# Use like: `something.yml` > will auto open vim for it
alias -s {yml,yaml,json,js,ts,xml}=nvim

function f() { find . -iname "*$1*" ${@:2} }
function r() { grep "$1" ${@:2} -R . }
function clip() { cat "$1" | pbcopy }

function mkcd() { mkdir -p "$@" && cd "$_"; }

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(custom_kube dir vcs vi_mode)
POWERLEVEL9K_CUSTOM_KUBE="kube_ps1"
POWERLEVEL9K_CUSTOM_KUBE_BACKGROUND="black"
POWERLEVEL9K_CUSTOM_KUBE_FOREGROUND="yellow"
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs history time)

# KUBE_PS1_SEPARATOR=''
KUBE_PS1_NS_COLOR=red
KUBE_PS1_CTX_COLOR=cyan
kubeoff

bindkey -v

# zprof
