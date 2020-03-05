#!/bin/bash
#
configHost(){
      if [  -z "$3" ]; then 
            new=`echo "$1 $2"`
            old=""
      else
            old=`echo "$1 $2"`
            new=`echo "$3 $4"`
      fi
      echo $old
      echo $new
      if [ "$old" != "$new" ]; then
            echo "true"
            if [  -z "$old" ]; then 
                  echo "123"
                  echo "$new" >> /etc/hosts 
            else 
                  sed -i "s/$old/$new/g" /etc/hosts
            fi
      fi
}

 

cp -f /etc/hosts /etc/hosts.bak

#ORG1

peer0ORG1IP=` kubectl get svc -n org1 | grep -m1 peer0 | awk '{print $3}' `\ "peer0.org1"

oldpeer0ORG1IP=`cat /etc/hosts | grep peer0.org1`


configHost $oldpeer0ORG1IP $peer0ORG1IP



peer1ORG1IP=` kubectl get svc -n org1 | grep -m1 peer1 | awk '{print $3}' `\ "peer1.org1"

oldpeer1ORG1IP=`cat /etc/hosts | grep peer1.org1`

configHost $oldpeer1ORG1IP $peer1ORG1IP

caORG1IP=` kubectl get svc -n org1 | grep -m1 ca | awk '{print $3}' `\ "ca.org1"

oldcaORG1IP=`cat /etc/hosts | grep ca.org1`


configHost $oldcaORG1IP $caORG1IP


# ORG2

peer0ORG2IP=` kubectl get svc -n org2 | grep -m1 peer0 | awk '{print $3}' `\ "peer0.org2"

oldpeer0ORG2IP=`cat /etc/hosts | grep peer0.org2`

configHost $oldpeer0ORG2IP $peer0ORG2IP


peer1ORG2IP=` kubectl get svc -n org2 | grep -m1 peer1 | awk '{print $3}' `\ "peer1.org2"

oldpeer1ORG2IP=`cat /etc/hosts | grep peer1.org2`

configHost $oldpeer1ORG2IP $peer1ORG2IP



caORG2IP=` kubectl get svc -n org2 | grep -m1 ca | awk '{print $3}' `\ "ca.org2"

oldcaORG2IP=`cat /etc/hosts | grep ca.org2`

configHost $oldcaORG2IP $caORG2IP


#orderer1

orderer0IP=` kubectl get svc -n orderer1 | grep -m1 orderer0-ex | awk '{print $3}' `\ "orderer0.orderer1"

oldorderer0IP=`cat /etc/hosts | grep orderer0.orderer1`

configHost $oldorderer0IP $orderer0IP