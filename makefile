default:
	@cat makefile | grep ^[a-z]

build: clean check
	git clone https://github.com/YumaYX/YS1.git
	cd YS1
	bundle install
	rake install:local
	cd -

	bundle install
	ruby app.rb > index.markdown
	sh app_each.sh

pub: check clean
	git status
	sleep 5
	git add .
	git commit -am 'update'
	git push

check:
	cd _codes && ls -1 *.rb | xargs -n1 ruby -c > /dev/null 2>&1

clean:
	rm -f ./*.markdown
