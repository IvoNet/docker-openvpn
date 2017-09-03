# purevpn-proxy image


## Run

Interactive mode:

```bash
docker run -it --privileged --name vpn --rm --dns 8.8.8.8 --dns 8.8.4.4 -v $(pwd)/config:/config -v $(pwd)/credentials:/credentials -p 3128:3128 ivonet/purevpn-proxy
```

Daemon mode:

```bash
docker run --privileged --name vpn --rm --dns 8.8.8.8 --dns 8.8.4.4 -v $(pwd)/config:/config -v $(pwd)/credentials:/credentials -p 3128:3128 ivonet/purevpn-proxy
```

# Use

* run as described above
* proxy to localhost:3218 
* have fun