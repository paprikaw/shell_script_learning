#!/bin/bash
echo ">>> Installing socat"
apt-get -y install socat
echo ">>> Installing acme"
curl  https://get.acme.sh | sh
source ~/.bashrc
echo ">>> Generation acme"
 ~/.acme.sh/acme.sh --issue -d $1 --standalone -k ec-256 --force
 ~/.acme.sh/acme.sh --installcert -d $1 --fullchainpath /usr/local/etc/v2ray/v2ray.crt --keypath /usr/local/etc/v2ray/v2ray.key --ecc --force
echo ">>> Install nginx"
apt update
apt install nginx
systemctl enable nginx
echo ">>> start nginx"
service nginx start
echo ">>> Install v2ray"
bash <(curl -L https://raw.githubusercontent.com/v2fly/fhs-install-v2ray/master/install-release.sh)
echo "start v2ray"
systemctl enable v2ray
service v2ray start
chown admin:admin /usr/local/etc/v2ray/config.json
chown admin:admin /usr/local/etc/v2ray
chown admin:admin /usr/local/etc/v2ray/config.json/v2ray.crt
chown admin:admin /usr/local/etc/v2ray/config.json/v2ray.key
chmod a+r /usr/local/etc/v2ray/config.json/v2ray.crt
chmod a+r /usr/local/etc/v2ray/config.json/v2ray.key