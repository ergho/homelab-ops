# Boostrap flux

## 1. Install the Flux manifests into the cluster

```bash
kubectl apply --kustomize ./cluster/bootstrap
```

## 2. Apply the Age, Github and cluster variable secrets
_These cannot be applied with `kubectl` in the regular fashion due to being encrypted with sops_

```bash
sops --decrypt cluster/bootstrap/age-key.sops.yaml | kubectl apply -f -
sops --decrypt cluster/bootstrap/github-deploy-key.sops.yaml | kubectl apply -f -
sops --decrypt cluster/flux/vars/cluster-secrets.sops.yaml | kubectl apply -f -
kubectl apply -f cluster/flux/vars/cluster-settings.yaml
```

##

```bash
kubectl apply --kustomize ./cluster/flux/config
```
