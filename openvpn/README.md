

* Correct run
```bash
docker run -it --privileged --name vpn --rm --dns 8.8.8.8 --dns 8.8.4.4 -v $(pwd)/config:/config -v $(pwd)/credentials:/credentials ivonet/openvpn
```

* Error no credentials file...
```bash
docker run -it --name vpn --rm -v $(pwd)/config:/config ivonet/openvpn
```

* Error no config....
```bash
docker run -it --name vpn --rm  -v $(pwd)/credentials:/credentials ivonet/openvpn
```

