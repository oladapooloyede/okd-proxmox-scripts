#!/bin/bash

ID_BOOTSTRAP=30000
MAC_BOOTSTRAP=72:3E:E6:0C:0B:B3

ID_MASTER0=30001
MAC_MASTER0=d6:d8:4d:d5:39:08
ID_MASTER1=30002
MAC_MASTER1=46:69:a9:bc:0f:54
ID_MASTER2=30003
MAC_MASTER2=36:37:ad:87:85:63

ID_WORKER0=30004
MAC_WORKER0=d6:d8:4d:d5:39:07
ID_WORKER1=30005
MAC_WORKER1=46:69:a9:bc:0f:55
ID_WORKER2=30006
MAC_WORKER2=36:37:ad:87:85:64

./scripts/create-vm.sh $ID_BOOTSTRAP okd-bootstrap $MAC_BOOTSTRAP
./scripts/create-vm.sh $ID_MASTER0 okd-master-0 $MAC_MASTER0
./scripts/create-vm.sh $ID_MASTER1 okd-master-1 $MAC_MASTER1
./scripts/create-vm.sh $ID_MASTER2 okd-master-2 $MAC_MASTER2
./scripts/create-vm.sh $ID_WORKER0 okd-worker-0 $MAC_WORKER0
./scripts/create-vm.sh $ID_WORKER1 okd-worker-1 $MAC_WORKER1
./scripts/create-vm.sh $ID_WORKER2 okd-worker-2 $MAC_WORKER2
