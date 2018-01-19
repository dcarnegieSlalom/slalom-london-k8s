#!/bin/sh
GREEN='\033[0;32m'
NC='\033[0;0m'

# Execute terraform init \ terraform plan \ terraform apply on iam role


# Execute terraform init \ terraform plan \ terraform apply on prerequisites (the cluster itself)


# Execute kubediff and work out what we need to redeploy to the cluster
kubediff ./k8s-gui

# Redeploy what we need to redeploy.


