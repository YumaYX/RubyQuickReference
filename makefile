default:
	sh app.sh | tee index.md
	ln -fnsv index.md README.md

pub: default
	git status
	sleep 5
	git add .
	git commit -am 'update'
	git push

