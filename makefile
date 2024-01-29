default:
	cat makefile

build: check
	sh app.sh > index.markdown
	sh app_each.sh

pub: check clean
	git status
	sleep 5
	git add .
	git commit -am 'update'
	git push

check:
	cd codes && ls -1 *.rb | xargs -n1 ruby > /dev/null 2>&1

clean:
	rm -f ./*.markdown
