#!/bin/sh
GREEN='\033[0;32m'
NC='\033[0;0m'

# Execute terraform init \ terraform plan \ terraform apply on iam role


# Execute terraform init \ terraform plan \ terraform apply on prerequisites (the cluster itself)


# Execute kubediff and work out what we need to redeploy to the cluster
pwd 
ls
echo $PATH

python ./kubediff/kubediff $(pwd)/k8s-gui/alb-ingress-k8s-gui.yaml

# Redeploy what we need to redeploy.


