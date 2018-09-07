
tag=duckietown/rpi-duckiebot-web_video_server

build:
	docker build -t $(tag) .

push:
	docker push $(tag)
