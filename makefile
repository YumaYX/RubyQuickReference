default:
	sh app.sh | tee index.md

pub:
	git status
	sleep 5
	git add .
	git commit -am 'update'
	git push

all: default pub
