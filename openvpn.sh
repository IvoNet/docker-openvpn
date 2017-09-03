#!/usr/bin/env bash
cd openvpn
docker build -t ivonet/openvpn .
#if [ $? -eq 0 ]; then
#    docker push ivonet/openvpn
#fi
