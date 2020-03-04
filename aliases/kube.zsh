# kube
alias kf='sudo kubefwd svc -n'
alias kde='kubectl get po --field-selector 'status.phase!=Evicted' -o json | kubectl delete -f -'
