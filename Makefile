
branch=$(shell git rev-parse --abbrev-ref HEAD)

tag=duckietown/rpi-duckiebot-web_video_server:$(branch)

build:
	docker build -t $(tag) .

push:
	docker push $(tag)
