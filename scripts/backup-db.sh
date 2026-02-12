#!/usr/bin/env bash
set -euo pipefail

# Configure timestamped filename
SCRIPTS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUPS_DIR="$SCRIPTS_DIR/../backups"
current_datetime=$(date +"%Y-%m-%d.%H%M%S")
backup_suffix="rykerwiki.sql"
backup_file="${current_datetime}.${backup_suffix}"

# Create database dump
echo "SCRIPTS_DIR=$SCRIPTS_DIR"
echo "BACKUPS_DIR=$BACKUPS_DIR"
docker exec rykerwiki-db pg_dump -U rykerwikijs rykerwiki > "${BACKUPS_DIR}/${current_datetime}.rykerwiki.sql"

# Compress database dump
tar -czf "${BACKUPS_DIR}/${backup_file}.tar.gz" -C "${BACKUPS_DIR}" "$(basename "$backup_file")"

