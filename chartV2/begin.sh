#!/bin/bash +x
kubectl create -f  ./namespaces.yaml
kubectl create -f  ./ca_org1.yaml
kubectl create -f  ./peer0_org1.yaml
kubectl create -f  ./peer1_org1.yaml


kubectl create -f  ./ca_org2.yaml
kubectl create -f  ./peer0_org2.yaml
kubectl create -f  ./peer1_org2.yaml


kubectl create -f  ./orderer0.yaml
kubectl create -f  ./orderer1.yaml
kubectl create -f  ./orderer2.yaml

kubectl create -f ./zookeeper0.yaml
kubectl create -f ./zookeeper1.yaml
kubectl create -f ./zookeeper2.yaml

kubectl create -f ./kafka0.yaml
kubectl create -f ./kafka1.yaml
kubectl create -f ./kafka2.yaml

kubectl create -f ./netConfig.yaml

