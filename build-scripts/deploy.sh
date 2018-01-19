#!/bin/bash
GREEN='\033[0;32m'
NC='\033[0;0m'
export PATH=$PATH:$(pwd)/kubediff
export PATH=$PATH:$(pwd)

# Execute terraform init \ terraform plan \ terraform apply on iam role


# Execute terraform init \ terraform plan \ terraform apply on prerequisites (the cluster itself)


# Execute kubediff and work out what we need to redeploy to the cluster
pwd 
ls
echo $PATH

python ./kubediff/kubediff $(pwd)/k8s-gui/kubernetes-dashboard-nodeports.yaml

# Redeploy what we need to redeploy.


