#!/bin/bash

# ConfigMap
kubectl apply -f configmap.yaml
kubectl get cm
kubectl get cm configmap.name -o yaml

# Secrets
# generic - passwords and tokens
# docker-registry - autorization in docker registry
# tls - TLS sertifications for Ingress Controller

kubectl create secret generic my_secrets --from-literal=user=bestUserEver --from-literal=pass=121345
kubectl get secret
kubectl get secret my_secrets -o yaml

echo sdfe342xx | base64 -d # decoding secrets

kubectl apply -f secrets.yaml --save-config

# Exec into pod
kubectl exec -it podname -- bash
kubectl exec -it podname -- env


