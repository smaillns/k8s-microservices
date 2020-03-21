# Swap out your secrets (do not commit to source control!!!)
# Run this script in the same directory as  your .travis.yml
travis encrypt-file build-scripts/large-secrets.txt
mv large-secrets.txt.enc build-scripts/large-secrets.txt.enc
travis encrypt KUBE_PASSWORD="q3QcmFgfOsGb16ap5IHV4xKjPMxBWi2y" --add
travis encrypt AWS_KEY="AKIAT4N63I2ZHPSJA2HQ" --add
travis encrypt AWS_SECRET_KEY="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" --add
