BOOTSTRAP_VER = 4.3.1

web:


.PHONY: clean_bootstrap
clean_bootstrap:
	rm -rf web/static/bootstrap
	rm -rf "bootstrap-${BOOTSTRAP_VER}"



web/static/bootstrap: "bootstrap-${BOOTSTRAP_VER}"
	mkdir -p web/static/bootstrap
	cp -r "bootstrap-${BOOTSTRAP_VER}/dist/css" web/static/bootstrap/
	cp -r "bootstrap-${BOOTSTRAP_VER}/dist/js" web/static/bootstrap/

	

.PHONY: bootstrap
bootstrap:  clean_bootstrap web/static/bootstrap

"v${BOOTSTRAP_VER}.zip": 
	wget -N  "https://github.com/twbs/bootstrap/archive/v${BOOTSTRAP_VER}.zip"	

"bootstrap-${BOOTSTRAP_VER}": "v${BOOTSTRAP_VER}.zip"
	unzip  "v${BOOTSTRAP_VER}.zip"

.PHONY: update_gitignore
update_gitignore:
		

