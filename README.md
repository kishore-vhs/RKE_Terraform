# Deploying Kubernetes Cluster with Rancher Kubernetes Engine (RKE) with Terraform.

- In cluster.tpl at 
```
network:
  plugin: flannel
  options:
    flannel_iface: eth0
```

- Change ```flannel_iface``` value based on your instance ethernet interface type.