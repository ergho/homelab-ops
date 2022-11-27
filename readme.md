Start by creating the machines with terraform.

Continue by using the ansible playbook to configure cluster

then create secret sops-age

```
cat ~/.config/sops/age/ergho.agekey | kubectl -n flux-system create secret generic sops-age --from-file=age.agekey=/dev/stdin
```

Then bootstrap flux by going to the bootstrap folder under cluster
