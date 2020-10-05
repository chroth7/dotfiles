alias dotv="nvim ~/.vimrc"
alias srcv="source ~/.vimrc"
alias dotz="nvim ~/.zshrc"
alias srcz="source ~/.zshrc"
alias v="/usr/local/bin/nvim"
alias vv="~/Downloads/nvim-osx64/bin/nvim"
alias vvv='/usr/local/bin/nvim --cmd "set rtp+=$(pwd)" .'
alias glcoud="gcloud"
alias kx="kubectx"
alias kn="kubens"
alias rmswp='find . -type f -name ".*.swp" -exec rm -f {} \;'
alias flushdns='sudo killall -HUP mDNSResponder'

alias cf='/usr/local/bin/functions'

# Global alias, expanded anywhere >> Use: ls -l G foo
alias -g G='| grep -i'
alias -g onecell=' cells-per-column=1'
alias -g allns=' --all-namespaces'

# Suffix alias, will automatically exec a program
# Use like: `something.yml` > will auto open vim for it
alias -s {yml,yaml,json,js,ts,xml}=nvim
