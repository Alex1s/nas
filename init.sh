#!/usr/bin/env bash

set -e
set -x

setenforce Permissive
sed -i 's/^SELINUX=enforcing/SELINUX=permissive/g' /etc/selinux/config

COMPOSE_VERSION="$(curl --no-progress-meter https://api.github.com/repos/docker/compose/releases/latest | jq -r .tag_name)"
COMPOSE_PATH="/usr/bin/docker-compose"
curl --no-progress-meter --location --output "$COMPOSE_PATH" "https://github.com/docker/compose/releases/download/$COMPOSE_VERSION/docker-compose-linux-x86_64"
chmod 755 "$COMPOSE_PATH"

dnf install -y https://zfsonlinux.org/epel/zfs-release-2-3$(rpm --eval "%{dist}").noarch.rpm
dnf config-manager --disable zfs
dnf config-manager --enable zfs-kmod
dnf install -y zfs
/usr/sbin/modprobe zfs
zpool import -a
systemctl enable zfs-scrub-weekly@SATA.timer --now

./install-hdparm-spindown-service.sh

podman compose up -d