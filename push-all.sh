#!/usr/bin/env bash
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