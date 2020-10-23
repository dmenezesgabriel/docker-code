setup:
	chmod +x scripts/setup.sh && \
	scripts/setup.sh

build:
	docker-compose build

run:
	docker-compose up

down:
	docker-compose down -v
