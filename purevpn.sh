#!/usr/bin/env bash
cd purevpn
docker build -t ivonet/purevpn .
#if [ $? -eq 0 ]; then
#    docker push ivonet/purevpn
#fi
