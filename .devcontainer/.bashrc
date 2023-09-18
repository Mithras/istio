alias t=terraform
alias k=kubectl
alias h=helm
alias i=istioctl

function kubectlgetall {
  for i in $(kubectl api-resources --verbs=list --namespaced -o name | grep -v 'events.events.k8s.io' | grep -v 'events' | sort | uniq); do
    echo "=== $i ==="
    kubectl -n ${1} get --ignore-not-found ${i}
  done
}
