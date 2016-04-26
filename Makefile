VER := 0.6.4

build:
	@docker build -t mongrelion/consul:${VER} .

run:
	@docker run --rm -it mongrelion/consul:${VER}
