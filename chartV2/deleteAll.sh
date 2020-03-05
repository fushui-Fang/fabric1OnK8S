#!/bin/bash


kubectl delete -f  ./ca_org1.yaml

kubectl delete -f  ./peer0_org1.yaml
kubectl delete -f  ./peer1_org1.yaml

kubectl delete -f  ./ca_org2.yaml

kubectl delete -f  ./peer0_org2.yaml
kubectl delete -f  ./peer1_org2.yaml


kubectl delete -f  ./orderer0.yaml
kubectl delete -f  ./orderer1.yaml
kubectl delete -f  ./orderer2.yaml

kubectl delete -f ./zookeeper0.yaml
kubectl delete -f ./zookeeper1.yaml
kubectl delete -f ./zookeeper2.yaml

kubectl delete -f ./kafka0.yaml
kubectl delete -f ./kafka1.yaml
kubectl delete -f ./kafka2.yaml

kubectl delete -f ./netConfig.yaml

kubectl delete -f  ./namespaces.yaml
