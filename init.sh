#!/usr/bin/env bash

set -e
set -x

dnf install -y https://zfsonlinux.org/epel/zfs-release-2-3$(rpm --eval "%{dist}").noarch.rpm
dnf config-manager --disable zfs
dnf config-manager --enable zfs-kmod
dnf install -y zfs
/usr/sbin/modprobe zfs
zpool import -a
systemctl enable zfs-scrub-weekly@SATA.timer --now

podman compose up -d