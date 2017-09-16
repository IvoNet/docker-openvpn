# openvpn image

This image enables you with some preparation to run openvpn within a docker container.

This image can be considered a base image for other openvpn based images...

## Build

* run the `build.sh` command

## Run

* download the ovpn config files from your vpn provider (see your vpn provider website)
* place the (extracted) files in a folder called `config`
* create a directory called `credentials` 
* create a file called `credentials/openvpn-credentials.txt` and put your username and password in there from your vpn provider each on a line
* run the following command:

```bash
docker run -it --privileged --name vpn --cap-add=NET_ADMIN --device=/dev/net/tun --rm --dns 8.8.8.8 --dns 8.8.4.4 -v $(pwd)/config:/config -v $(pwd)/credentials:/credentials ivonet/openvpn
```

If something goes wrong you hopefully get a specific message telling what to fix ;-)
