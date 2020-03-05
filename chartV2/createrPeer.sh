#!/bin/bash +x
kubectl create -f  ./peer0_org1.yaml
kubectl create -f  ./peer1_org1.yaml

kubectl create -f  ./peer0_org2.yaml
kubectl create -f  ./peer1_org2.yaml
