default:
	cat makefile

build: check
	sh app.sh > index.md
	sh app_readme.sh > README.md

pub: check build
	git status
	sleep 5
	git add .
	git commit -am 'update'
	git push

check:
	cd codes && ls -1 *.rb | xargs -n1 ruby > /dev/null
