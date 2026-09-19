#!/bin/bash
set -e

cd /opt/cmtr-d1m0og5d-app

python3 -m venv venv
./venv/bin/pip install --upgrade pip
./venv/bin/pip install -r requirements.txt

cat > /etc/systemd/system/cmtr-app.service <<'SERVICE'
[Unit]
Description=CMTR Flask Application
After=network.target

[Service]
WorkingDirectory=/opt/cmtr-d1m0og5d-app
ExecStart=/opt/cmtr-d1m0og5d-app/venv/bin/gunicorn --bind 0.0.0.0:8000 app:app
Restart=always
User=root

[Install]
WantedBy=multi-user.target
SERVICE

systemctl daemon-reload
systemctl enable cmtr-app
