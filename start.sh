#!/bin/bash
echo "Starting Superset..."
superset db upgrade
superset fab create-admin --username jinal --firstname Jinal --lastname Swarnakar --email jinal.swarnakar@fiftyfivetech.io --password 123 || true
superset init
superset run -h 0.0.0.0 -p ${PORT:-8080}
