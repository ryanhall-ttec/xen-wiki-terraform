#!/bin/bash
set -xe

SSH_PORT="$1"

apt-get update
apt-get install -y docker.io python3 python3-venv

docker swarm init

sed -i '/^Port /d' /etc/ssh/sshd_config
echo "Port $SSH_PORT" >> /etc/ssh/sshd_config
systemctl daemon-reload
systemctl restart ssh
