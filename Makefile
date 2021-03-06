build:
	docker build --rm -t dotimage .

test:
	./dotimage test

run:
	docker run -d -p 5000:5000 --name dotimage dotimage

ROOT_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

debug:
	docker rm -f dotimagedebug || true
	mkdir -p data
	docker run -d -p 5001:5000 -e DEBUG=1 -e UPLOAD_FOLDER=/opt -v $(ROOT_DIR)/data:/opt --name dotimagedebug dotimage

clean:
	docker rm -f dotimage || true
	docker rm -f dotimagedebug || true
	docker rmi dotimage || true
