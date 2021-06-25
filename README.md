# cron image for Wordpress

This extends `mysql:latest` with cron & curl which is used with our 
our deployed Wordpress websites.


## Makefile commands:  

```
make update
make build
make push
make shell
```

## Related Repositories

- [nonfiction/wordpress](https://github.com/nonfiction/wordpress)
- [nonfiction/platform](https://github.com/nonfiction/platform)
- [nonfiction/traefik](https://github.com/nonfiction/traefik)
