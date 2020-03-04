alias dotv="vim ~/.vimrc"
alias srcv="source ~/.vimrc"
alias dotz="vim ~/.zshrc"
alias srcz="source ~/.zshrc"
alias v="/usr/local/bin/vim"
alias glcoud="gcloud"
alias kx="kubectx"
alias kn="kubens"
alias rmswp='find . -type f -name ".*.swp" -exec rm -f {} \;'

alias cf='/usr/local/bin/functions'

# Global alias, expanded anywhere >> Use: ls -l G foo
alias -g G='| grep -i'
alias -g onecell=' cells-per-column=1'
alias -g allns=' --all-namespaces'

# Suffix alias, will automatically exec a program
# Use like: `something.yml` > will auto open vim for it
alias -s {yml,yaml,json,js,ts,xml}=vim