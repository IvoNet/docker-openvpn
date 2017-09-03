#!/usr/bin/env bash
build-all.sh
if [ $? -ne 0 ]; then
    echo "Build failed."
    exit 1
fi

docker push ivonet/openvpn
if [ $? -ne 0 ]; then
    echo "Push failed."
    exit 1
fi

docker push ivonet/purevpn
if [ $? -ne 0 ]; then
    echo "Push failed."
    exit 1
fi

docker push ivonet/purevpn-proxy
if [ $? -ne 0 ]; then
    echo "Push failed."
    exit 1
fi