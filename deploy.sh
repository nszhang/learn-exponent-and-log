#!/usr/bin/env bash
# Deploy ExponentAce to webapp01 → https://math.pnpsolutions.ca/learn-exponent-and-log/
#
# Production layout (webapp01.pnpsolutions.ca):
#   /var/www/learn-exponent-and-log/          app (this repo; built on server)
#   /var/www/learn-exponent-and-log/server/.env  DATABASE_URL only (backup script reads it;
#                                              NOT in git — do not delete)
#   /etc/learn-exponent-and-log.env           root:600 — DATABASE_URL, JWT_SECRET, PORT=3005
#   systemd: learn-exponent-and-log.service   Express serves API + built client on 127.0.0.1:3005
#   nginx:   /etc/nginx/conf.d/math.pnpsolutions.ca.conf
#            location /learn-exponent-and-log/{,/api/} → proxy to :3005 (prefix stripped)
set -euo pipefail
HOST=nzhang@webapp01.pnpsolutions.ca
APP=/var/www/learn-exponent-and-log

rsync -a --delete \
  --exclude .git \
  --exclude node_modules \
  --exclude client/dist \
  --exclude server/.env \
  ./ "$HOST:$APP/"

ssh "$HOST" "set -e
  cd $APP
  npm --prefix server ci --omit=dev
  npm --prefix client ci
  npm --prefix client run build
  sudo systemctl restart learn-exponent-and-log
  sleep 2
  systemctl is-active learn-exponent-and-log
  curl -sf http://127.0.0.1:3005/api/health
"
echo
echo "✅ Deployed: https://math.pnpsolutions.ca/learn-exponent-and-log/"
