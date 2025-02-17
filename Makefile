DEFAULT_IMAGE_NAME=php-postgres-xdebug-webserver
FINAL_IMAGE_NAME=ghabriel/php-postgres-xdebug

build:
	@if [ -z "${tag}" ]; then \
		echo "'tag' environment variable is not set";\
		exit 1;\
	fi
	docker compose build
	docker image tag ${DEFAULT_IMAGE_NAME}:latest ${FINAL_IMAGE_NAME}:${tag}
	docker rmi ${DEFAULT_IMAGE_NAME}

publish:
	@if [ -z "${tag}" ]; then \
		echo "'tag' environment variable is not set";\
		exit 1;\
	fi
	docker push ${FINAL_IMAGE_NAME}:${tag}
