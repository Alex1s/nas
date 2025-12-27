#!/bin/sh
set -e

SERVICE_FILE="hdparm-spindown.service"
SYSTEMD_DIR="/etc/systemd/system"

install -m 0644 "$SERVICE_FILE" "$SYSTEMD_DIR/$SERVICE_FILE"
systemctl daemon-reload
systemctl enable "$SERVICE_FILE" --now

echo "Service $SERVICE_FILE installed and enabled successfully."