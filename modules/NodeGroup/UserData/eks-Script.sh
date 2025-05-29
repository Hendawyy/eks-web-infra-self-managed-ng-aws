MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="//"

--//
Content-Type: application/node.eks.aws

---
apiVersion: node.eks.aws/v1alpha1
kind: NodeConfig
spec:
  cluster:
    apiServerEndpoint: ${cluster_endpoint}
    certificateAuthority: ${cluster_ca}
    cidr: 172.20.0.0/16
    name: ${cluster_name}
  kubelet:
    config:
      maxPods: 17
      clusterDNS:
      - 172.20.0.10
    flags:
    - "--node-labels=eks.amazonaws.com/nodegroup-image=${node_image},eks.amazonaws.com/capacityType=${capacity_type},eks.amazonaws.com/nodegroup=${nodegroup_name}"

--//--
