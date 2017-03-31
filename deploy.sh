#!/bin/bash

#kops delete cluster --name $KOPS_NAME --yes
#exit 1

kops create cluster \
  --name $KOPS_NAME \
  --state $KOPS_STATE_STORE \
  --node-count 5 \
  --zones us-east-1a,us-east-1b,us-east-1e \
  --master-zones us-east-1a,us-east-1b,us-east-1e \
  --vpc $KOPS_VPC_ID \
  --cloud aws \
  --node-size m3.medium \
  --master-size m3.large \
  -v 10 \
  --kubernetes-version "1.4.9" \
  --bastion \
  --topology private \
  --networking weave \
