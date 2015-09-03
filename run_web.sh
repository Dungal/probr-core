#!/bin/sh

bower install --allow-root
python manage.py collectstatic --noinput
python manage.py migrate

# Flush everytime and create user
python manage.py flush --noinput
echo "from django.contrib.auth.models import User; User.objects.create_superuser('admin', 'admin@example.com', 'admin')" | python manage.py shell

uwsgi --socket :8000 --module probr.wsgi_django:application --enable-threads
