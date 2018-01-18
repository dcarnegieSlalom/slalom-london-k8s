#!/bin/sh
# Swap out your secrets (do not commit to source control!!!)
# Run this script in the same directory as  your .travis.yml
travis encrypt KUBE_CLUSTER_CERTIFICATE="secretvalue" --add
travis encrypt KUBE_CLIENT_CERTIFICATE="secretvalue" --add
travis encrypt KUBE_CLIENT_KEY="secretvalue" --add
travis encrypt KUBE_PASSWORD="secretvalue" --add

travis encrypt AWS_KEY="secretvalue" --add
travis encrypt AWS_SECRET_KEY="secretvalue" --add
