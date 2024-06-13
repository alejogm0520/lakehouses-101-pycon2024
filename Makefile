# .DEFAULT_GOAL := local
# .PHONY: tests
SHELL := /bin/bash

# General Commands
help:
	cat Makefile

install:
	sh ./Scripts/0.download_dependencies.sh

data_unzip:
	cd data
	unzip moves.zip
	unzip pokemon.zip
	unzip types.zip

run:
	docker-compose up --attach spark

open_local_jupiter:
	open http://127.0.0.1:8888/lab

open_local_minio:
	open http://127.0.0.1:9001

