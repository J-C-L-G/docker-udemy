# Pulling `images` from Docker hub

Since the image was pushed as public, we don't have to be authenticated in order to download it,
we can make reference to the repository that we created
```shell
docker pull jclgps/hello-world-node-app:latest_2023
```

```shell-output
latest_2023: Pulling from jclgps/hello-world-node-app
Digest: sha256:fd2ab0d46540fe0c630c16e15e39d3ec705f3190d5d273ad2654c2718dff3aee
Status: Image is up to date for jclgps/hello-world-node-app:latest_2023
docker.io/jclgps/hello-world-node-app:latest_2023
```

And this way when we list the images we can see the `image` that was pulled (if was outdated) from docker hub:

```shell-output
docker images
REPOSITORY                    TAG           IMAGE ID       CREATED       SIZE
jclgps/hello-world-node-app   latest_2023   228eedf1b6f0   3 hours ago   1.1GB <====== pulled (or up to date)
node_rest                     latest        228eedf1b6f0   3 hours ago   1.1GB
node                          latest        341640cdfda9   2 weeks ago   1.1GB
```

Now we can run the `image` in a `container` as:

```shell
docker run -p 3000:80 --rm jclgps/hello-world-node-app
```


We can also directly run using an image reference this way if is not locally installed, docker will try to `pull` it
and then `run` it, however if after it was initially `pulled` there was an `update`, if you `run` again it won't fetch
before execute it, you will have to `pull` it again to make sure you have the latest version (if needed).

```shell
docker run -p 3000:80 --rm jclgps/hello-world-node-app
```





