BOOTSTRAP_VER = 4.3.1
REGISTRY_URL=hub.lnxsystems.com
PROJECT=library
IMAGE_NAME=django-bootstrap-template
TAG=0.1.1


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
	venv/bin/python web/manage.py migrate 
	sh scripts/create_temp_admin.sh
.PHONY:
run:
	DEBUG=True venv/bin/python web/manage.py runserver 0.0.0.0:8000

.PHONY:
migrate:
	venv/bin/python web/manage.py migrate
.PHONY:
makemigrations:
	venv/bin/python web/manage.py migrations


docker: web 
	docker build -t ${REGISTRY_URL}/${PROJECT}/${IMAGE_NAME}:${TAG} .

pull:   
	docker  pull ${REGISTRY_URL}/${PROJECT}/${IMAGE_NAME}:latest 

tag: 
	docker tag ${REGISTRY_URL}/${PROJECT}/${IMAGE_NAME}:${TAG} ${REGISTRY_URL}/${PROJECT}/${IMAGE_NAME}:latest
 
push:  docker tag
	docker push ${REGISTRY_URL}/${PROJECT}/${IMAGE_NAME}:latest
	docker push ${REGISTRY_URL}/${PROJECT}/${IMAGE_NAME}:${TAG}

