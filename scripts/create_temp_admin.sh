#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
WEBDIR="$(dirname $DIR)"

cd $WEBDIR

echo "from django.contrib.auth.models import User; User.objects.create_superuser('admin', 'admin@localhost', 'password')" | venv/bin/python web/manage.py shell
