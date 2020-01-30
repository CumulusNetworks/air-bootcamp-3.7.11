#!/bin/bash

mkdir artifacts 2>/dev/null
ssh-keygen -f ./artifacts/id_rsa -N ''

pub_key=`cat ./artifacts/id_rsa.pub`

cat > ./artifacts/user-data << EOF
#cloud-config
ssh_authorized_keys:
  - ${pub_key}
EOF
