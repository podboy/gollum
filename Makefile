MAKEFLAGS += --always-make

all: podman-build podman-run

podman-build:
	podman build --rm -t my-gollum -f Dockerfile

podman-run:
	podman run --privileged --rm -p 4567:4567 -v ${PWD}/config.rb:/config.rb -v ${PWD}:/wiki my-gollum --config /config.rb
