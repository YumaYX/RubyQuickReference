default:
	cat makefile

build: check
	sh app.sh > index.md
	sh app_each.sh

buildrm:
	sh app_readme.sh > README.md

pub: check clean buildrm
	git status
	sleep 5
	git add .
	git commit -am 'update'
	git push

check:
	cd codes && ls -1 *.rb | xargs -n1 ruby > /dev/null

clean:
	rm -rf each
	rm -f index.md
