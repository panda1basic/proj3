#!/usr/bin/env bash
set -e

OWNER_UID=1000
OWNER_GID=1000

dirs=(
  postgres_data
  redmine_data
  mongo_data
  rocketchat_data
  gitlab_data/data
  gitlab_data/logs
  gitlab_data/config
  prometheus_data
  grafana_data
)

for dir in "${dirs[@]}"; do
  if [ ! -d "$dir" ]; then
    echo "Creating directory: $dir"
    mkdir -p "$dir"
  fi

  current_uid=$(stat -c '%u' "$dir")
  if [ "$current_uid" != "$OWNER_UID" ]; then
    echo "Fixing owner for $dir → $OWNER_UID:$OWNER_GID"
    chown -R "$OWNER_UID":"$OWNER_GID" "$dir"
  fi
done

echo "✅ directories are created for UID $OWNER_UID"
