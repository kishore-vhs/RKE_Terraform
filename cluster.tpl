ssh_key_path: C:\Users\VHS Kishore\Desktop\Keys\sivamware.pem
cluster_name: hskglobaltech.shop
#kubernetes_version: v1.26.7-rancher1-1
nodes:
- address: ${master1}
  user: ubuntu
  role:
  - controlplane
  - etcd
  - worker
- address: ${master2}
  user: ubuntu
  role:
  - controlplane
  - etcd
  - worker
- address: ${master3}
  user: ubuntu
  role:
  - controlplane
  - etcd
  - worker
- address: ${worker1}
  user: ubuntu
  role:
  - worker
- address: ${worker2}
  user: ubuntu
  role:
  - worker
- address: ${worker3}
  user: ubuntu
  role:
  - worker

authentication:
  strategy: x509
  sans:
  - "${nlb}"
  - "rke.hskglobaltech.shop"
services:
  etcd:
    snapshot: true
    creation: 6h
    retention: 24h

# Required for external TLS termination with
# ingress-nginx v0.22+
ingress:
  provider: nginx
  options:
    use-forwarded-headers: "true"

network:
  plugin: flannel
  options:
    flannel_iface: ens5
    flannel_backend_type: vxlan
    flannel_autoscaler_priority_class_name: system-cluster-critical # Available as of RKE v1.2.6+
    flannel_priority_class_name: system-cluster-critical # Available as of RKE v1.2.6+
