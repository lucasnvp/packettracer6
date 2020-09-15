NAME = packettracer

docker-build:
	sudo docker build -t $(NAME) .

run-bash:
	docker run --rm -ti $(NAME) bash

run-pt:
	docker run -ti --rm -e DISPLAY=$$DISPLAY \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		--mount type=bind,source="$$(pwd)"/archivos,target=/home/luqui/pt/saves \
		--env QT_X11_NO_MITSHM=1 $(NAME)
