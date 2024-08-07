.PHONY: build
build:
	docker buildx build -t supernomad111/mongo-backups:latest -f Dockerfile --platform linux/amd64,linux/arm64 --push .
