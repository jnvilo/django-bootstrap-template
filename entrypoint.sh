#!/bin/sh



if [ ! -z "$DJANGO_DEBUG" ]
then
	echo "Starting dev server"
	python3 web/manage.py runserver 0.0.0.0:8081
else
	cd /app/web/
	python3 manage.py collectstatic --noinput
	gunicorn --access-logfile -  --error-logfile - -b 0.0.0.0:8000 web.wsgi 
fi
