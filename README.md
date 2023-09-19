## Setup

- Terraform

  ```sh
  cd /workspace/terraform
  terraform init
  terraform apply
  ```

- Istio

  ```sh
  cd /workspace/istio
  istioctl operator init
  kubectl apply -f istio-operator.yaml
  kubectl label namespace default istio-injection=enabled
  ```

- Gateway API

```sh
kubectl kustomize "github.com/kubernetes-sigs/gateway-api/config/crd/experimental?ref=v0.8.0-rc1" | kubectl apply -f -
# kubectl kustomize "github.com/kubernetes-sigs/gateway-api/config/crd?ref=v0.8.1" | kubectl apply -f -
```

- Kiali

```sh
kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.19/samples/addons/prometheus.yaml
kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.19/samples/addons/kiali.yaml
istioctl dashboard kiali
```
