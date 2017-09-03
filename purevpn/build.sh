#!/usr/bin/env bash
docker build -t ivonet/purevpn .
docker rmi $(docker images -q -f dangling=true)
