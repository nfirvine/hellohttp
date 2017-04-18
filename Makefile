version := $(shell cat VERSION)
tag := quay.io/nfirvine/hellohttp
localport := 8081

version.go: version.go.tmpl
	sed "s/{version}/$(version)/g" < version.go.tmpl > version.go

image: hellohttp.go version.go
	docker run --rm \
		-v "$(shell pwd):/src" \
		-v /var/run/docker.sock:/var/run/docker.sock \
		centurylink/golang-builder $(tag):$(version)

push: image
	docker push $(tag):$(version)

push-gcloud: image
	gcloud docker -- push $(tag):$(version)

run: image
	docker run -p $(localport):80 $(tag):$(version)
