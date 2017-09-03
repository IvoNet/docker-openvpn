#!/usr/bin/env bash
cd purevpn
build.sh
if [ $? -eq 0 ]; then
    docker push ivonet/purevpn
fi
