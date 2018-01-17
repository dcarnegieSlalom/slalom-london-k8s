#!/bin/sh
GREEN='\033[0;32m'


# install kubectl
echo -e "${GREEN}==== INSTALLING KUBECTL ===="
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
chmod +x ./kubectl
echo -e "${GREEN}==== SUCCESSFULLY INSTALLED KUBECTL ===="
echo ''

# install kops
echo -e "${GREEN}==== INSTALLING KOPS ===="
curl -LO https://github.com/kubernetes/kops/releases/download/$(curl -s https://api.github.com/repos/kubernetes/kops/releases/latest | grep tag_name | cut -d '"' -f 4)/kops-linux-amd64
chmod +x kops-linux-amd64
echo -e "${GREEN}==== SUCCESSFULLY INSTALLED KOPS ===="
echo ''

# install aws
echo -e "${GREEN}==== INSTALLING AWS ===="
pip install --user awscli
export PATH=$PATH:$HOME/.local/bin
chmod +x aws
echo -e "${GREEN}==== SUCCESSFULLY INSTALLED AWS ===="
echo ''

# install kubediff
echo -e "${GREEN}==== INSTALLING KUBEDIFF ===="
git clone https://github.com/weaveworks/kubediff
cd kubediff
sudo pip install -r requirements.txt
chmod +x kubediff
echo -e "${GREEN}==== SUCCESSFULLY INSTALLED KUBEDIFF ===="
echo ''

# install terraform
echo -e "${GREEN}==== INSTALLING TERRAFORM ===="
apt-get install unzip
curl -L0 https://releases.hashicorp.com/terraform/0.11.2/terraform_0.11.2_linux_amd64.zip
unzip terraform_0.11.2_linux_amd64.zip -d ./
chmod +x terraform
echo -e "${GREEN}==== SUCCESSFULLY INSTALLED TERRAFORM ===="
echo ''

# Set kubernetes secrets
#kubectl config set clusters.kubernetes-group-xxxxx.certificate-authority-data "$KUBE_CLUSTER_CERTIFICATE"
#kubectl config set users.kubernetes-group-xxxxx-admin.client-certificate-data "$KUBE_CLIENT_CERTIFICATE"
#kubectl config set users.kubernetes-group-xxxxx-admin.client-key-data "$KUBE_CLIENT_KEY"

# set AWS secrets

