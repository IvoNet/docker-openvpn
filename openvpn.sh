#!/usr/bin/env bash
cd openvpn
build.sh
if [ $? -eq 0 ]; then
    docker push ivonet/openvpn
fi
