#!/bin/bash

# Environment variables expected:
export HOST
export DB_HOST
export DB_PORT
export DB_USER
export DB_PASSWORD
export DB_NAME

# Append crontab with variables filled in
esh /cron/crontab.esh >> /etc/crontab

# Start cron in foreground
cron -f
