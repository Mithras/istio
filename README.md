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
  ```

## Demo

```sh
kubectl label namespace default istio-injection=enabled
kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.19/samples/bookinfo/platform/kube/bookinfo.yaml
kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.19/samples/bookinfo/networking/bookinfo-gateway.yaml
istioctl analyze
```
