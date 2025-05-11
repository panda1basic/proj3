#!/usr/bin/env bash
set -e

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
done

echo "✅ directories are created"
