FROM ubuntu:17.04
MAINTAINER IvoNet <webmaster@hardcoder.nl>

# Evironment variables
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
 && apt-get install --no-install-recommends -y openvpn iptables wget curl unzip net-tools \
 && wget --no-check-certificate https://github.com/Yelp/dumb-init/releases/download/v1.2.0/dumb-init_1.2.0_amd64.deb \
 && dpkg -i dumb-init_*.deb \
 && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /dumb-init_*.deb


ADD bin/ /usr/local/bin/
ADD entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh \
 && chmod +x /usr/local/bin/*.sh

WORKDIR /etc/openvpn
VOLUME ["/config","/credentials"]
ENTRYPOINT ["/usr/bin/dumb-init", "/entrypoint.sh"]
