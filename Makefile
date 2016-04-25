build:
	@docker build -t mongrelion/consul:0.6.3 .

run:
	@docker run --rm -it mongrelion/consul:0.6.3
