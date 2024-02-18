# https://makefiletutorial.com/

SHELL:=bash

APP_DIR:=app/{{ cookiecutter.project_slug }}

.PHONY: up
up:
	docker compose up -d

.PHONY: down
down:
	docker compose down

.PHONY: restart
restart: down up

# ############################################################################ #
# ############################# DEVELOPMENT FLOW ############################# #
# ############################################################################ #

.PHONY: update-dependencies
update-dependencies:
	cd $(APP_DIR) && mix deps.get

.PHONY: compile-dependencies
compile-dependencies: update-dependencies
	cd $(APP_DIR) && mix deps.compile

.PHONY: format
format:
	cd $(APP_DIR) && mix format

.PHONY: check-format
check-format:
	cd $(APP_DIR) && mix format --check-formatted

.PHONY: lint
lint:
	cd $(APP_DIR) && mix credo

.PHONY: lint-hard
lint-hard: update-dependencies compile-dependencies
	cd $(APP_DIR) && mix dialyzer

.PHONY: static-analysis
static-analysis: lint lint-hard

.PHONY: test
test: up
	docker compose exec -it web mix test

.PHONY: pre-commit
pre-commit: check-format static-analysis test

# ############################################################################ #
# ################################## DOCKER ################################## #
# ############################################################################ #

.PHONY: docker-lint
docker-lint:
	docker run --rm -i hadolint/hadolint < Dockerfile

.PHONY: docker-build
docker-build:
	docker image build \
		-t phoenix:latest \
		-f Dockerfile \
		.

.PHONY: docker-rmi
docker-rmi:
	docker image rmi phoenix:latest

.PHONY: docker-check-config
docker-check-config:
	docker compose config

.PHONY: st
st:
	docker ps -a --format 'table \{\{.Names\}\}\\t\{\{.Status\}\}\\t\{\{.Ports\}\}'

# ############################################################################ #
# ################################# PHOENIX ################################## #
# ############################################################################ #

.PHONY: phoenix-create
phoenix-create:
	docker run -it \
		-w /app/ \
		-v ./app:/app \
		-u phoenix \
		phoenix \
		mix phx.new --install $(app_name)

.PHONY: phoenix-destroy
phoenix-destroy:
	rm -rf $(APP_DIR)

.PHONY: phoenix-bash
phoenix-bash:
	docker compose exec -it \
		web \
		bash

.PHONY: phoenix-admin
phoenix-admin:
	docker compose exec -it \
		-u 0 \
		web \
		bash

.PHONY: phoenix-iex
phoenix-iex:
	docker compose exec -it \
	-w /$(APP_DIR) \
	web \
	iex -S mix

.PHONY: phoenix-migrate
phoenix-migrate:
	docker compose exec -it \
	-w /$(APP_DIR) \
	web \
	mix ecto.migrate

.PHONY: phoenix-clean
phoenix-clean:
	rm -rf $(APP_DIR)/_build

.PHONY: phoenix-logs
phoenix-logs:
	docker compose logs -f web

# ############################################################################ #
# ################################# DATABASE ################################# #
# ############################################################################ #

.PHONY: database-create
database-create:
	docker exec -it \
		-w /$(APP_DIR) \
		-u phoenix \
		phoenix \
		mix ecto.create

.PHONY: database-cli
database-cli:
	docker compose exec -it \
		database \
		psql -U postgres

.PHONY: database-logs
database-logs:
	docker compose logs -f database
