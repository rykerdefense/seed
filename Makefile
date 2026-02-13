help:
	@echo "Available targets:"
	@echo "  build   Build containers"
	@echo "  up      Start containers"
	@echo "  down    Stop containers"
	@echo "  logs    Tail logs in realtime"
	@echo "  open    Open in the browser"
	@echo "  rebuild Purge cache and rebuild"
	@echo "  run     Start the container (alias of up)"
	@echo "  shell   Connect to the wiki container via command-line"
	@echo "  watch   Monitor file changes in realtime"


build:
	$(MAKE) hosts
	docker compose build
	docker compose up -d

up:
	docker compose up -d

down:
	docker compose down

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
	$(MAKE) up

shell:
	docker compose exec wiki zsh

watch:
	docker compose up --watch
