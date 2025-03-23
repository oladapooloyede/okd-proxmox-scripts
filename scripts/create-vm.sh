#!/bin/bash

ID=$1
NAME=$2
MACADDR=$3
STORAGE=nvme
NET_TYPE=virtio
BRIDGE=vmbr0
VLAN=20

PATH=$(pwd)
BASE=29999
ADD_STORAGE=112G

/usr/sbin/qm clone $BASE $ID --name $NAME
/usr/sbin/qm set $ID --net0 $NET_TYPE,bridge=$BRIDGE,macaddr=$MACADDR,tag=$VLAN

if [ "$NAME" = "okd-bootstrap" ]; then
   IGNITION=bootstrap
elif [ "$NAME" = "okd-master-0" ]; then
   IGNITION=master
elif [ "$NAME" = "okd-master-1" ]; then
   IGNITION=master
elif [ "$NAME" = "okd-master-2" ]; then
   IGNITION=master
else
   IGNITION=worker
fi

echo "args: -fw_cfg name=opt/com.coreos/config,file=$PATH/ignitions/$IGNITION.ign" >> /etc/pve/qemu-server/$ID.conf

/usr/sbin/qm start $ID
