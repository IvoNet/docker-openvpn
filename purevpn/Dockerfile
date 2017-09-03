FROM ivonet/openvpn:latest
MAINTAINER IvoNet <webmaster@hardcoder.nl>

RUN wget --no-check-certificate https://s3-us-west-1.amazonaws.com/heartbleed/linux/linux-files.zip \
 && unzip linux-files.zip \
 && mkdir -p /config \
 && mv -v "./Linux OpenVPN Updated files" /PureVPN \
 && rm -fv linux-files.zip \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

VOLUME ["/credentials"]
ENTRYPOINT ["/usr/bin/dumb-init", "/entrypoint.sh", "/bin/cp", "-r", "/PureVPN", "/config/"]