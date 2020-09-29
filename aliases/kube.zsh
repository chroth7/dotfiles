# kube
alias kf='sudo kubefwd svc -n'
function deleteEvicted() {
  kubectl get pods --all-namespaces | grep Evicted | awk '{print $2 " --namespace=" $1}' | xargs kubectl delete pod
}
