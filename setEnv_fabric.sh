#!/bin/bash +x



#生成证书
./bin/cryptogen generate --config=./cluster-config.yaml

mkdir -p ./crypto-config/ordererOrganizations/orderer1/block

if [ ! -d channel-artifacts ]; then
	mkdir channel-artifacts
fi

export FABRIC_CFG_PATH=$PWD

# 生成创世块
./bin/configtxgen -profile TwoOrgsOrdererGenesis -outputBlock ./channel-artifacts/genesis.block

# 生成channel创建交易
./bin/configtxgen -profile TwoOrgsChannel -outputCreateChannelTx \
./channel-artifacts/mychannel.tx -channelID mychannel

# 拷贝创世块进指定目录，该位置已在orderer0~2.yaml中指定
cp ./channel-artifacts/genesis.block  ./crypto-config/ordererOrganizations/orderer1/block/

# 复制p0o1证书
cp ./crypto-config/peerOrganizations/org1/peers/peer0.org1/tls/ca.crt ./crypto-config/ordererOrganizations/orderer1/orderers/orderer0.orderer1/tls/ca_p0o1.crt
cp ./crypto-config/peerOrganizations/org1/peers/peer0.org1/tls/ca.crt ./crypto-config/ordererOrganizations/orderer1/orderers/orderer1.orderer1/tls/ca_p0o1.crt
cp ./crypto-config/peerOrganizations/org1/peers/peer0.org1/tls/ca.crt ./crypto-config/ordererOrganizations/orderer1/orderers/orderer2.orderer1/tls/ca_p0o1.crt

# 复制p1o1证书
cp ./crypto-config/peerOrganizations/org1/peers/peer1.org1/tls/ca.crt ./crypto-config/ordererOrganizations/orderer1/orderers/orderer0.orderer1/tls/ca_p1o1.crt
cp ./crypto-config/peerOrganizations/org1/peers/peer1.org1/tls/ca.crt ./crypto-config/ordererOrganizations/orderer1/orderers/orderer1.orderer1/tls/ca_p1o1.crt
cp ./crypto-config/peerOrganizations/org1/peers/peer1.org1/tls/ca.crt ./crypto-config/ordererOrganizations/orderer1/orderers/orderer2.orderer1/tls/ca_p1o1.crt

# 复制p0o2证书
cp ./crypto-config/peerOrganizations/org2/peers/peer0.org2/tls/ca.crt ./crypto-config/ordererOrganizations/orderer1/orderers/orderer0.orderer1/tls/ca_p0o2.crt
cp ./crypto-config/peerOrganizations/org2/peers/peer0.org2/tls/ca.crt ./crypto-config/ordererOrganizations/orderer1/orderers/orderer1.orderer1/tls/ca_p0o2.crt
cp ./crypto-config/peerOrganizations/org2/peers/peer0.org2/tls/ca.crt ./crypto-config/ordererOrganizations/orderer1/orderers/orderer2.orderer1/tls/ca_p0o2.crt

# 复制p1o2证书
cp ./crypto-config/peerOrganizations/org2/peers/peer1.org2/tls/ca.crt ./crypto-config/ordererOrganizations/orderer1/orderers/orderer0.orderer1/tls/ca_p1o2.crt
cp ./crypto-config/peerOrganizations/org2/peers/peer1.org2/tls/ca.crt ./crypto-config/ordererOrganizations/orderer1/orderers/orderer1.orderer1/tls/ca_p1o2.crt
cp ./crypto-config/peerOrganizations/org2/peers/peer1.org2/tls/ca.crt ./crypto-config/ordererOrganizations/orderer1/orderers/orderer2.orderer1/tls/ca_p1o2.crt

#配置balance-transfer

rm -rf /tmp/fabric*

rm -rf ./balance-transfer/artifacts/channel/*

cp -r ./crypto-config/ ./balance-transfer/artifacts/channel/

cp ./channel-artifacts/mychannel.tx ./balance-transfer/artifacts/channel/

cp ./channel-artifacts/genesis.block ./balance-transfer/artifacts/channel/


#配置nfs文件

rm -rf /opt/share/mycluster/resources/*

cp -r channel-artifacts/ /opt/share/mycluster/resources/

cp -r crypto-config /opt/share/mycluster/resources/

mkdir /opt/share/mycluster/resources/kafka

mkdir /opt/share/mycluster/resources/zookeeper





