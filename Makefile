help:
	@echo "Container commands:"
	@echo "  COMMAND   	DESCRIPTION"
	@echo "  build   	Build containers"
	@echo "  logs    	Tail logs in realtime"
	@echo "  open    	Open in the browser"
	@echo "  rebuild 	Purge cache and rebuild"
	@echo "  run     	Start the container (alias of up)"
	@echo "  shell   	Connect to the wiki container via command-line"
	@echo "  start    	Start all containers"
	@echo "  stop    	Stop all containers"
	@echo "  status  	Display status of containers, images, and volumes"
	@echo "  watch   	Monitor file changes in realtime"

	@echo "\n\nDatabase commands:"
	@echo "  COMMAND   	DESCRIPTION"
	@echo "  db-backup 	Create raw+archived database backup (backups/*.tar.gz)"
	@echo "  db-start   Start the postgres database container"
	@echo "  db-stop    Stop the postgres database container"
	@echo "  db-restart Restart the postgres database container"

	@echo "\n\nWiki instance commands:"
	@echo "  COMMAND  	 DESCRIPTION"
	@echo "  wiki-docs    Open wiki.js documentation in browser"
	@echo "  wiki-start   Start the Wiki container"
	@echo "  wiki-stop    Stop the Wiki container"
	@echo "  wiki-restart Restart the Wiki container"

	@echo "\n"


# Container commands
build:
	$(MAKE) hosts
	docker compose build
	docker compose up -d

hosts:
	./scripts/config-hostsfile.sh

logs:
	docker compose logs -f

open:
	open "http://seed.rykerdefense.local:8080"

rebuild:
	docker compose down
	docker compose build --no-cache
	docker compose up -d

run:
	$(MAKE) start

shell:
	docker compose exec wiki zsh

start:
	docker compose up -d

stop:
	docker compose down

status:
	docker ps
	docker image list
	docker volume ls
watch:
	docker compose up --watch


# Database commands

db-backup:
	./scripts/backup-db.sh

db-start:
	docker compose up db

db-stop:
	docker compose down db

db-restart:
	docker compose restart db


# Wiki commands

wiki-docs:
	open "https://docs.requarks.io"

wiki-start:
	docker compose up wiki

wiki-stop:
	docker compose down wiki

wiki-restart:
	docker compose restart wiki
