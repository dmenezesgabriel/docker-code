build:
	time docker-compose build

run:
	docker-compose up -d

down:
	docker-compose down -v

# Raspberry pi
build-pi:
	time docker-compose -f docker-compose.pi.yml build

run-pi:
	PROJECT_DIR="~/Documents/repos" docker-compose -f docker-compose.pi.yml up -d

down-pi:
	docker-compose -f docker-compose.pi.yml down
