#!/bin/bash
# SOURCE 
source ../projects/*.evn

# VARIABLES
mn_dir=/root/masternode/project/
build_dir=/root/masternode/build
mn_address=$(ip route get 1 | awk '{print $NF;exit}');
rpc_passwd=$(date +%s | sha256sum | base64 | head -c 32 ;);
wl_passwd=$(date +%s | sha256sum | base64 | head -c 16 ;);