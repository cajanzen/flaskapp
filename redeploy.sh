#!/usr/bin/env bash


redeploy(){
	cd ~/flaskapp
	git pull
	# if test passes then redeploy
	docker-compose -f docker-compose.test.yml up --build --exit-code-from sut && docker-compose up -d --build
}

redeploy


# some warnings to keep in mind
# - it is a crazy idea to run a netcat/bash based webserver as deploy hook. use a CI solution like jenkins, circleci, etc
# - git pull may not always work if someone is poking around the source tree (only a concern during development)
#while true ; do  echo -e "HTTP/1.1 200 OK\n\n $(date)" | nc -l -p 5001 -q 1 >> webhook.log; redeploy; done
