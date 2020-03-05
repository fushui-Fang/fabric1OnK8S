#!/bin/bash


kubectl delete -f  ./peer0_org1.yaml
kubectl delete -f  ./peer1_org1.yaml

kubectl delete -f  ./peer0_org2.yaml
kubectl delete -f  ./peer1_org2.yaml
