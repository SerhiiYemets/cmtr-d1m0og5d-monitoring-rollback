#!/bin/bash
set -e

systemctl stop cmtr-app 2>/dev/null || true
rm -rf /opt/cmtr-d1m0og5d-app
mkdir -p /opt/cmtr-d1m0og5d-app
