#!/bin/sh
mkdir ~/.kube
mv ./build-scripts/kubeconfig ~/.kube/config

#decrypt the large secrets
openssl aes-256-cbc -K $encrypted_e6568868d258_key -iv $encrypted_e6568868d258_iv -in ./build-scripts/large-secrets.sh.enc -out large-secrets.sh -d
# run the script to get the secrets as environment variables
chmod +x ./large-secrets.sh
sh . large-secrets.sh
echo "secret value: $KUBE_CLUSTER_CERTIFICATE"

# Set kubernetes secrets
./kubectl config set clusters.cluster.zigzag-london.com.certificate-authority-data "$KUBE_CLUSTER_CERTIFICATE"
./kubectl config set users.cluster.zigzag-london.com.client-certificate-data "$KUBE_CLIENT_CERTIFICATE"
./kubectl config set users.cluster.zigzag-london.com.client-key-data "$KUBE_CLIENT_KEY"
./kubectl config set users.cluster.zigzag-london.com.password "$KUBE_PASSWORD"
./kubectl config set users.cluster.zigzag-london.com-basic-auth.password "$KUBE_PASSWORD"

# set AWS secrets
mkdir ~/.aws
touch ~/.aws/credentials
echo '[default]' >> ~/.aws/credentials
echo "aws_access_key_id = $AWS_KEY">> ~/.aws/credentials
echo "aws_secret_access_key = $AWS_SECRET_KEY" >> ~/.aws/credentials

# set AWS region
touch ~/.aws/config
echo '[default]' >> ~/.aws/config
echo "output = json">> ~/.aws/config
echo "region = eu-west-1" >> ~/.aws/config
