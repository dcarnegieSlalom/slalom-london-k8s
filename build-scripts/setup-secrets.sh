# Swap out your secrets (do not commit to source control!!!)
# Run this script in the same directory as  your .travis.yml
travis encrypt-file build-scripts/large-secrets.sh
travis encrypt KUBE_PASSWORD="Isb3DlU9uVLsJZ1oKe4HAs6V2qy5Y4HQ" --add

travis encrypt AWS_KEY="AKIAIRNJXXIAE5XUPH3Q" --add
travis encrypt AWS_SECRET_KEY="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" --add
