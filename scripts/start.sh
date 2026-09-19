#!/bin/bash
set -e

systemctl restart cmtr-app
sleep 3

systemctl is-active --quiet cmtr-app || {
    systemctl status cmtr-app --no-pager
    journalctl -u cmtr-app -n 50 --no-pager
    exit 1
}
