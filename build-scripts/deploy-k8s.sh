#!/bin/bash
GREEN='\033[0;32m'
NC='\033[0;0m'
export PATH=$PATH:$(pwd)

echo -e "${GREEN}==== Deploying RBAC role ====${NC}"
cd ./rbac/
for f in $(find ./ -name '*.yaml' -or -name '*.yml'); do kubectl apply -f $f --validate=false; done
echo -e "${GREEN}==== Done deploying RBAC role ====${NC}"
echo ''

echo -e "${GREEN}==== Deploying iam role ====${NC}"
cd ../kube2iam/
for f in $(find ./ -name '*.yaml' -or -name '*.yml'); do kubectl apply -f $f --validate=false; done
echo -e "${GREEN}==== Done deploying iam role ====${NC}"
echo ''
echo -e "${GREEN}==== Deploying external dns ====${NC}"
cd ../external_dns/
for f in $(find ./ -name '*.yaml' -or -name '*.yml'); do kubectl apply -f $f --validate=false; done
echo -e "${GREEN}==== Done deploying external dns ====${NC}"
echo ''

echo -e "${GREEN}==== Deploying the udagram application ====${NC}"
 
cd ../udagram-project/udagram-deployment/k8s 
    

    echo -e "${GREEN}==== Deploying secrets and configmaps ====${NC}"
    kubectl apply aws-secret.yaml  --validate=false
    kubectl apply env-secret.yaml  --validate=false
    kubectl apply env-configmap.yaml  --validate=false
    echo -e "${GREEN}==== Done Deploying ${f} ====${NC}"

    echo -e "${GREEN}==== Creating services and deployments ====${NC}"
    # kubectl apply -f reverseproxy-deployment.yaml --validate=false
    # kubectl apply -f reverseproxy-service.yaml --validate=false

    # kubectl apply -f backend-feed-deployment.yaml --validate=false
    # kubectl apply -f backend-feed-service.yaml --validate=false

    # kubectl apply -f backend-user-deployment.yaml --validate=false
    # kubectl apply -f backend-user-service.yaml --validate=false

    # kubectl apply -f frontend-deployment.yaml --validate=false
    # kubectl apply -f frontend-service.yaml --validate=false
    echo -e "${GREEN}==== Done Deploying ${f} ====${NC}"


echo -e "${GREEN}==== Done deploying apps ====${NC}"
echo ''