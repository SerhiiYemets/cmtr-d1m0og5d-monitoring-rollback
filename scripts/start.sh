#!/bin/bash
set -e

systemctl daemon-reload
systemctl enable cmtr-app
systemctl restart cmtr-app

sleep 3

if ! systemctl is-active --quiet cmtr-app; then
    echo "cmtr-app failed to start"
    systemctl status cmtr-app --no-pager || true
    journalctl -u cmtr-app -n 50 --no-pager || true
    exit 1
fi

curl -f http://localhost:8000/health
