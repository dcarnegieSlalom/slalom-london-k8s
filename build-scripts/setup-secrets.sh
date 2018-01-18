# Swap out your secrets (do not commit to source control!!!)
# Run this script in the same directory as  your .travis.yml
travis encrypt-file build-scripts/large-secrets.sh
mv large-secrets.sh.enc build-scripts/large-secrets.sh.enc
travis encrypt KUBE_PASSWORD="[your kube password here]" --add
travis encrypt AWS_KEY="[your aws key here]" --add
travis encrypt AWS_SECRET_KEY="[your aws secret key here]" --add
