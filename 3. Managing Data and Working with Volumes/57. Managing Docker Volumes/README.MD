# Managing `Volumes`

**List** volumes:
```shell
docker volume ls
```


**Create** a volume using `docker volume create [:volume-name]`
```shell
docker volume create test-volume
```


**Use** this new volume that we created as in a container
```shell-etc
docker run --name demo-app-container -v test-volume:/app/feedback
```


**Inspect** volume with:
```shell
docker volume inspect test-volume
```

```shell-output
[
    {
        "CreatedAt": "2020-12-23T19:51:04Z",
        "Driver": "local",
        "Labels": {},
        "Mountpoint": "/var/lib/docker/volumes/test-volume/_data",
        "Name": "test-volume",
        "Options": {},
        "Scope": "local"
    }
]
```

**Delete** the volume using:
```shell
docker volume rm test-volume
```
> NOTE: Only possible if not being used by a container.


**Remove All** unused volumes:
```shell
docker volume prune
```




