#!/bin/bash
set -e

cd /opt/cmtr-d1m0og5d-app

rm -rf venv
python3 -m venv venv
./venv/bin/pip install --upgrade pip
./venv/bin/pip install -r requirements.txt

cat > /etc/systemd/system/cmtr-app.service <<'SERVICE'
[Unit]
Description=CMTR Flask Application
After=network.target

[Service]
Type=simple
User=root
WorkingDirectory=/opt/cmtr-d1m0og5d-app
ExecStart=/opt/cmtr-d1m0og5d-app/venv/bin/gunicorn --workers 2 --bind 0.0.0.0:8000 app:app
Restart=always
RestartSec=2

[Install]
WantedBy=multi-user.target
SERVICE

systemctl daemon-reload
systemctl enable cmtr-app
