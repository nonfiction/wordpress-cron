# cron image for Wordpress

This extends `mysql:latest` with cron & curl which is used with our 
deployed Wordpress websites.

## Usage:

```yaml
version: '3.8'
services:

  cron:
    image: nonfiction/wordpress-cron:v1

    deploy:
      mode: replicated
      replicas: 1

    environment:
      HOST: "mysite.abc.example.com"
      DB_HOST: "mysql.example.com"
      DB_PORT: "3306"
      DB_USER: "mysite"
      DB_PASSWORD: "supersecretpassword"
      DB_NAME: "mysite_abc_example_com"

    volumes:
      - /data/mysite/dump.sql:/cron/dump.sql
```

## Makefile commands:  

```
make update
make build
make push
make shell
```

## Related Repositories

- [nonfiction/wordpress](https://github.com/nonfiction/wordpress)
- [nonfiction/wordpress-base](https://github.com/nonfiction/wordpress)
- [nonfiction/platform](https://github.com/nonfiction/platform)
- [nonfiction/traefik](https://github.com/nonfiction/traefik)
