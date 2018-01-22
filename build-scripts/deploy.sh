#!/bin/bash
GREEN='\033[0;32m'
NC='\033[0;0m'
export PATH=$PATH:$(pwd)/kubediff
export PATH=$PATH:$(pwd)

# Execut kubectl apply on iam role
cd kube2iam
kubectl apply -f kube2iam-ds.yaml
kubectl apply -f kube2iam-service-account-role-binding.yaml
cd ..

# Execute kubectl apply on ingress 
cd ingress
terraform init
terraform plan
terraform apply
kubectl apply -f alb-ingress-controller.yaml
kubectl apply -f ingress-service-account-role-binding.yaml

# Execute kubectl apply on external dns
cd external-dns
terraform init
terraform plan
terraform apply
kubectl apply -f external_dns_test.yaml
kubectl apply -f external_dns.yaml
kubectl apply -f external-dns-service-account-role-binding.yaml
cd ..

# Execute kubectl apply on test application
cd hello_app
kubectl apply -f hello_app_deployment.yaml
kubectl apply -f hello_app_ingress_resource.yaml


