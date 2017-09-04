# PureVPN image

This image extends on the [ivonet/openvpn](../openvpn/README.md) image in order to have purevpn 
enabled by default.

No real practical value as the proxy version is more use ;-)

## usage

### pull

```bash
docker pull ivonet/purevpn
```

### run

create a directory called `credentials` and put a file in there called `openvpn-credentials.txt`
put your username and password in there from your vpn provider each on a line and then run the following command:

```bash
docker run -it --privileged --name vpn --rm --dns 8.8.8.8 --dns 8.8.4.4 -v $(pwd)/credentials:/credentials ivonet/purevpn
```

### Check

The following command should give another IP address then your onw IP if it all works...
```bash
docker exec -it vpn curl ipecho.net/plain
```