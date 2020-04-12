# #!/bin/sh
set -ex

# Wait for Postgres to become available.
until psql -h postgres -U "postgres" -c '\q' 2>/dev/null; do
   >&2 echo "Postgres is unavailable - sleeping"
   sleep 1
done

/opt/app/bin/start_server start
