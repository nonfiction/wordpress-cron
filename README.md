# cron image for Wordpress

This extends `mysql:latest` with cron & curl which is used with our 
deployed Wordpress websites.

## Usage:

```yaml
version: '3.8'
services:

  cron:
    image: nonfiction/wordpress-cron:v2

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints: [node.role == manager]
      resources:
        limits:
          cpus: '0.1'
          memory: 20M
        reservations:
          cpus: '0.0'
          memory: 5M

    environment:
      HOST: "mysite.abc.example.com"
      HOST_USER: "mysite"
      HOST_PASSWORD: "secret"
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
