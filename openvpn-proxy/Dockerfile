FROM ivonet/openvpn
MAINTAINER IvoNet <webmaster@hardcoder.nl>

RUN apt-get update \
 && apt-get install --no-install-recommends -y  squid3 \
 && mv -f /etc/squid/squid.conf /etc/squid/squid.conf.original \
 && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD squid/ /etc/squid/

RUN chmod +x /etc/squid/squid-*.sh \
 && mkdir -p /etc/service/squid \
 && ln -s /etc/squid/squid-run.sh /etc/service/squid/run

EXPOSE 3128
CMD ["service", "squid", "start"]