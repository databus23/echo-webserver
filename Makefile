IMAGE := databus23/echo-webserver
build:
	docker build -t $(IMAGE) .

push:
	docker push $(IMAGE)
