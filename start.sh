#!/bin/bash

# Get PORT from environment or default to 8080
PORT=${PORT:-8080}

echo "Starting Superset setup and server on port $PORT..."

# Upgrade DB and initialize (safe to re-run)
superset db upgrade
superset init

# Create admin user if it doesn’t exist
superset fab create-admin \
    --username jinal \
    --firstname Jinal \
    --lastname Swarnakar \
    --email jinal.swarnakar@fiftyfivetech.io \
    --password 123 || true

# Start Superset
superset run -h 0.0.0.0 -p $PORT --with-threads
