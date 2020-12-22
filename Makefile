ifneq (,$(wildcard ./.env.host))
    include .env.host
    export
endif


build:
	time docker-compose build

run:
	PROJECT_DIR=$(PROJECT_DIR) docker-compose up -d

down:
	docker-compose down -v

# Raspberry pi
build-pi:
	time docker-compose -f docker-compose.pi.yml build

run-pi:
	PROJECT_DIR=$(PROJECT_DIR) docker-compose -f docker-compose.pi.yml up -d

down-pi:
	docker-compose -f docker-compose.pi.yml down
