#!/bin/sh

# install kubectl
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
chmod +x ./kubectl

# install kops
curl -LO https://github.com/kubernetes/kops/releases/download/$(curl -s https://api.github.com/repos/kubernetes/kops/releases/latest | grep tag_name | cut -d '"' -f 4)/kops-linux-amd64
chmod +x kops-linux-amd64

# install aws
pip install --user awscli
export PATH=$PATH:$HOME/.local/bin

# install kubediff
git clone https://github.com/weaveworks/kubediff
cd kubediff
pip install -r requirements.txt


# install terraform
apt-get install unzip
curl -L0 https://releases.hashicorp.com/terraform/0.11.2/terraform_0.11.2_linux_amd64.zip
unzip terraform_0.11.2_linux_amd64.zip -d ./

# Set kubernetes secrets
#kubectl config set clusters.kubernetes-group-xxxxx.certificate-authority-data "$KUBE_CLUSTER_CERTIFICATE"
#kubectl config set users.kubernetes-group-xxxxx-admin.client-certificate-data "$KUBE_CLIENT_CERTIFICATE"
#kubectl config set users.kubernetes-group-xxxxx-admin.client-key-data "$KUBE_CLIENT_KEY"

# set AWS secrets

