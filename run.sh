#!/bin/bash

# Environment variables expected:
export HOST_USER
export HOST_PASSWORD
export DB_HOST
export DB_PORT
export DB_USER
export DB_PASSWORD
export DB_NAME

# Check for host user and password
HOST_AUTH=""
[ ! -z "$HOST_USER" ] && [ ! -z "$HOST_PASSWORD" ] && HOST_AUTH="${HOST_USER}:${HOST_PASSWORD}@"

# Add authentication to $HOST if provided
export HOST="${HOST_AUTH}${HOST}"

# Append crontab with variables filled in
esh /cron/crontab.esh >> /etc/crontab

# Start cron in foreground
cron -f
