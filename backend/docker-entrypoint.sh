#!/bin/sh
set -e

until nc -z "postgres" "5432"; do
  echo "Waiting for postgres..."
  sleep 1
done
echo "PostgreSQL started"

python manage.py collectstatic --noinput

python manage.py migrate --noinput

exec gunicorn --bind 0.0.0.0:8000 kittygram_backend.wsgi
