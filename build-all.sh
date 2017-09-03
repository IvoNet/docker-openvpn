#!/usr/bin/env bash
cd openvpn
build.sh
if [ $? -ne 0 ]; then
    echo "Build failed."
    exit 1
fi

cd ../openvpn-proxy
build.sh
if [ $? -ne 0 ]; then
    echo "Build failed."
    exit 1
fi

cd ../purevpn
build.sh
if [ $? -ne 0 ]; then
    echo "Build failed."
    exit 1
fi

cd ../purevpn-proxy
build.sh
if [ $? -ne 0 ]; then
    echo "Build failed."
    exit 1
fi

