# PureVPN image

This image extends on the `ivonet/openvpn` image in order to have purevpn 
enabled by default.

## usage

### pull

```bash
docker pull ivonet/purevpn
```

### run

```bash
docker run -it \
  --privileged \
  --name vpn \
  --rm \
  --dns 8.8.8.8 --dns 8.8.4.4 \
  -v $(pwd)/credentials:/credentials \
  ivonet/purevpn
```

```bash
docker run -it --privileged --name vpn --rm --dns 8.8.8.8 --dns 8.8.4.4 -v $(pwd)/credentials:/credentials ivonet/purevpn
```