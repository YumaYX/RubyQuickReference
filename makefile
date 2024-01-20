default:
	sh app.sh | tee index.md
	ln -fnsv index.md README.md

pub: check default
	git status
	sleep 5
	git add .
	git commit -am 'update'
	git push

check:
	cd codes && ls -1 *.rb | xargs -n1 ruby > /dev/null