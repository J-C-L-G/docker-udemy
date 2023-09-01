# Attached & Detached Mode

When we execute `docker start[image:id/name]` in a stopped container, that container will be running in the 
**background** or in `detached` mode.

When we execute `docker run [image:id/name]` this starts the container in the **foreground**, this will block
the terminal from where it was started.

The `default` is:

1) `docker run` => `attached` mode.
2) `docker start` => `detached` mode.
>NOTE: this can be configured.

When a container is running in `attached` mode we can see and listen for the container's output, 
see the output stream in the terminal where the container is running.

## Starting in `detached` mode
To run a container in `detached` mode (contrary to the default setting) we pass the `-d` flag
this will start the container while not listening or blocking the terminal

```shell-output
CONTAINER ID   IMAGE          COMMAND                  CREATED      STATUS                    PORTS     NAMES
66d1353bba0b   aaab7435aa4a   "docker-entrypoint.s…"   4 days ago   Exited (137) 3 days ago             admiring_allen
7f35b565b5a7   aaab7435aa4a   "docker-entrypoint.s…"   4 days ago   Exited (137) 4 days ago             festive_rosalind
```

```shell
docker run -p 9000:80 -d aaab7435aa4a
```

## Attaching to a running container
If at a later point you need to `re-attach` to a running container, we can execute `docker container attach [container:id/name]`
```shell-output
docker ps   
CONTAINER ID   IMAGE          COMMAND                  CREATED         STATUS         PORTS                  NAMES
dfc6adb4d356   aaab7435aa4a   "docker-entrypoint.s…"   4 minutes ago   Up 7 seconds   0.0.0.0:9000->80/tcp   sweet_fermat
```

```shell
docker container attach dfc6adb4d356
```


## Reading `Logs` from a running container
When we need to get access to a container's output running in `detached` mode, we can execute `docker logs [container:id/name]`

```shell-ouput
docker ps                
CONTAINER ID   IMAGE          COMMAND                  CREATED         STATUS         PORTS                  NAMES
dfc6adb4d356   aaab7435aa4a   "docker-entrypoint.s…"   7 minutes ago   Up 4 seconds   0.0.0.0:9000->80/tcp   sweet_fermat
```

```shell
docker logs dfc6adb4d356
```

If we need to retrieve existing logs and keep "listening" for them (getting `attached` to it) we can use the 
**follow** `-f` flag.

```shell
docker logs dfc6adb4d356 -f
```


## Starting a **stopped** container in `attached` mode
Finally, when we want to start a stopped container (which by default start in `detached` mode) we can send the `-a` flag 
`docker start [container:id/name] -a`

```shell-output
CONTAINER ID   IMAGE          COMMAND                  CREATED          STATUS                        PORTS     NAMES
dfc6adb4d356   aaab7435aa4a   "docker-entrypoint.s…"   13 minutes ago   Exited (137) 32 seconds ago             sweet_fermat
```

```shell
docker start dfc6adb4d356 -a
```
