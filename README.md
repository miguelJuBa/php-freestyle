# PHP freestyle

## Motivation 
This is just a program to learn some PHP framewoks and things.

## Docker dev environment
Build the dev environment:
```
podman build -t php-freestyle-dev:latest .
```

Run your dev environment in docker:
```
podman run --rm -v ${PWD}:/opt/ -it php-freestyle-dev:latest /bin/bash
```