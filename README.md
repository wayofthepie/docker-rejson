# Redis ReJSON Image
Docker image for redis 4.0 with the rejson module.

# Building And Running
Simply run `build.sh` with the name you want to give the image to build.

```
$ ./build.sh redis-json
```

To launch a container:

```
$ docker run --name rj --rm redis-json
```

Or, with the port to connect to exposed on the host:

```
$ docker run --name rj --rm -p 6379:6379 redis-json
```

Finally, to run the cli on a running instance:

```
$ docker exec -ti rj redis-cli
```

