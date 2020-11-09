# open a new session (add name)	
alias tn="tmux new -s" 	

# attach a named session (add name)	
alias ta="tmux a -t"

# kill ALL sessions
alias txkill="tmux kill-server"
# kill all OTHER sessions
alias txk="tmux kill-session -a"

# tmuxinator
alias tx=tmuxinator
alias txs="tmuxinator start" # mnemonic: start session
alias txn="tmuxinator new"
alias txe="tmuxinator edit"
