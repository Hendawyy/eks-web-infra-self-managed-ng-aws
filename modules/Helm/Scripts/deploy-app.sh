#!/bin/bash
set -e

if [ ! -d "simple-3-tier-app" ]; then
  git clone https://github.com/Hendawyy/simple-3-tier-app.git
fi

cd simple-3-tier-app/K8sManifests/

kubectl apply -f 1-Namespace.yaml
kubectl apply -f BackendDep.yaml
kubectl apply -f BackendService.yaml
kubectl apply -f FrontEndSvc.yaml
kubectl apply -f FrontendDep.yaml
kubectl apply -f backend-configmap.yaml
kubectl apply -f ingress.yaml

echo "App manifests deployed!"
