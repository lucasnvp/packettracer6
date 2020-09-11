NAME = packettracer

docker-build:
	sudo docker build -t $(NAME) .

run-bash:
	docker run --rm -ti $(NAME) bash

run-pt:
	docker run -ti --rm -e DISPLAY=$$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix --env QT_X11_NO_MITSHM=1 $(NAME)
