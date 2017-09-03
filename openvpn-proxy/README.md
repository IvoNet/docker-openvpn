# openvpn proxy


## Run

```bash
docker run -it --privileged --name vpn --rm --dns 8.8.8.8 --dns 8.8.4.4 -v $(pwd)/config:/config -v $(pwd)/credentials:/credentials ivonet/openvpn-proxy
```