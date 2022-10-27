Start by creating the machines with terraform.

Continue by using the ansible playbook to configure cluster

then create secret sops-age

```
cat ~/.config/sops/age/ergho.agekey | kubectl -n flux-system create secret generic sops-age --from-file=age.agekey=/dev/stdin
```

Then bootstrap flux

```
flux bootstrap github --personal --owner=ergho --repository=homelab-ops --path=./cluster/lab/ --token-auth --cluster-domain=apps.ergho.org
```

Decide if i want to keep using this custom domain or not... we will see but at least it works for now...
