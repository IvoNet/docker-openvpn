#!/bin/bash

"$@"

CREDENTIALS=/credentials/openvpn-credentials.txt
if [ -f ${CREDENTIALS} ]
then
    echo "Found credentials file..."
    chmod 600 ${CREDENTIALS}
else
    echo "[ERROR] Credentials file not found..."
    echo "[ERROR] please make sure /credentials/openvpn-credentials.txt is created"
    echo "[ERROR] username on first line and password on second line (no spaces)"
    exit 1
fi

if [ "$(ls -A /config)" ]
then
  echo "Found configuration files..."
  echo "Copying config files to /etc/openvpn..."
  find /config -iname "*.ovpn"  -exec cp -v "{}" /etc/openvpn/ \;
  find /config -iname "ca.crt"  -exec cp -v "{}" /etc/openvpn/ \;
  find /config -iname "Wdc.key" -exec cp -v "{}" /etc/openvpn/ \;
  cd /etc/openvpn
  chmod 600 Wdc.key ca.crt *.ovpn
  echo "Adjusting config files to use the credentials provided..."
  sed -i "s~auth-user-pass~auth-user-pass ${CREDENTIALS}~g" *.ovpn
else

  echo "[ERROR] No configuration found for a ovpn provider."
  echo "[ERROR] Please download the ovpn settings and unpack them into the /config folder"
  echo "[ERROR] e.g. https://s3-us-west-1.amazonaws.com/heartbleed/linux/linux-files.zip"
  echo "[ERROR] contains the config files for PureVPN."
  exit 1
fi

if [ -z "$OPENVPN_CONFIG" ]
then
    OPENVPN_CONFIG=Netherlands1-tcp.ovpn
fi

ORIG_IP=$(curl -s ipecho.net/plain)
echo "Before the vpn has been activated: $ORIG_IP"
NEW_IP="$ORIG_IP"
echo "Starting OpenVPN.."
openvpn --daemon --log /var/log/openvpn --script-security 2 --auth-nocache --config "$OPENVPN_CONFIG"
while [ "$ORIG_IP" == "$NEW_IP" ]
do
    sleep 2
    NEW_IP=$(curl -s ipecho.net/plain)
done
echo "After the vpn has been activated: $NEW_IP"

exec tail -f -n 0 /var/log/openvpn

