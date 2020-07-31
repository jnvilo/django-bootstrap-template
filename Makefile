BOOTSTRAP_VER = 4.3.1

.PHONY: web
web: bootstrap venv migrate

.PHONY: setup
setup: venv web/requirements.txt bootstrap

.PHONY: clean
clean: clean_bootstrap


.PHONY: clean_bootstrap
clean_bootstrap:
	rm -rf web/bootstrap/static/bootstrap
	rm -rf "bootstrap-${BOOTSTRAP_VER}"

.PHONY: bootstrap
bootstrap: web/bootstrap/static/bootstrap 

web/bootstrap/static/bootstrap:
	sh ./scripts/manage_bootstrap.sh 
	touch web/bootstrap/static/bootstrap

.PHONY: update_gitignore
update_gitignore:
		
.PHONY:
venv:
	virtualenv venv
	source venv/bin/activate && pip install -r web/requirements.txt

.PHONY:
run:
	venv/bin/python web/manage.py runserver 0.0.0.0:8000

.PHONY:
migrate:
	venv/bin/python web/manage.py migrate
.PHONY:
makemigrations:
	venv/bin/python web/manage.py migrations



