# purevpn-proxy image


## Run

Interactive mode:

```bash
docker run -it --privileged --name vpn --rm --dns 8.8.8.8 --dns 8.8.4.4 -v $(pwd)/credentials:/credentials -p 3128:3128 ivonet/purevpn-proxy
```
Synology NAS:
* put the `openvpn-credentials.txt` file in th docker/purevpn-proxy folder
* ssh onto nas
* change directory to the .../docker/purevpn-proxy
* run command:

```bash
docker run -it --rm --name purevpn-proxy --privileged --dns 8.8.8.8 --dns 8.8.4.4 -v $(pwd):/credentials -p 3128:3128 ivonet/purevpn-proxy
docker run -it --rm --name purevpn-proxy --cap-add=NET_ADMIN --device=/dev/net/tun --dns 8.8.8.8 --dns 8.8.4.4 -v $(pwd):/credentials -p 3128:3128 ivonet/purevpn-proxy
docker run -it --rm --name purevpn-proxy --privileged --cap-add=NET_ADMIN --device=/dev/net/tun --dns 8.8.8.8 --dns 8.8.4.4 -v $(pwd):/credentials -p 3128:3128 ivonet/purevpn-proxy
```
* remove `-it --rm` if you are happy with how it works and want to start it from DSM

Daemon mode:

```bash
docker run --privileged --name vpn --rm --dns 8.8.8.8 --dns 8.8.4.4 -v $(pwd)/credentials:/credentials -p 3128:3128 ivonet/purevpn-proxy
```

# Use

* run as described above
* proxy to localhost:3218 
* have fun