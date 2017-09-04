# openvpn proxy

Squid proxy image based on [ivonet/openvpn](../openvpn/README.md).


## Run

* Do the same preparations as described [here](../openvpn/README.md)
* Start the image:


```bash
docker run \
     -it \
     --privileged \
     --name vpn \
     --rm \
     --dns 8.8.8.8 --dns 8.8.4.4 \
     -v $(pwd)/config:/config \
     -v $(pwd)/credentials:/credentials \
     -p 3128:3128 \
     ivonet/openvpn-proxy                 
```

## Usage

When the image runs you can point your proxy to `localhost` port `3128` and have fun


## Other commands

Just the bash console:
```bash
docker run -it --entrypoint=/bin/bash ivonet/openvpn-proxy
```

