tag := v3
update: build push
build: ; docker buildx build -t nonfiction/wordpress-cron:$(tag) .
push:	 ; docker push nonfiction/wordpress-cron:$(tag)
shell: ; docker run -it --rm nonfiction/wordpress-cron:$(tag) bash
