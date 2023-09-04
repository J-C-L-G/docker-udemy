# Inspecting Images
We can `inspect` the container structure by sending the command `docker image inspect [image:id/name]`, in
the following example, we will inpect:

1. Custom `image` built using `node` as base
2. `node` base `image`


```shell
docker images
```

```shell-output
REPOSITORY   TAG       IMAGE ID       CREATED       SIZE
<none>       <none>    62d1fc18e4fd   6 days ago    1.1GB
node         latest    341640cdfda9   2 weeks ago   1.1GB
```

## Inspecting by `Image` id.

```shell
docker image inspect 62d1fc18e4fd 
```

```shell-output
[
    {
        "Id": "sha256:62d1fc18e4fd3c3871c5bfd43f6eb024c5f9059f16820927e08341e8a0f48397",
        "RepoTags": [],
        "RepoDigests": [],
        "Parent": "",
        "Comment": "buildkit.dockerfile.v0",
        "Created": "2023-08-28T01:33:23.931735506Z",
        "Container": "",
        "ContainerConfig": {
            "Hostname": "",
            "Domainname": "",
            "User": "",
            "AttachStdin": false,
            "AttachStdout": false,
            "AttachStderr": false,
            "Tty": false,
            "OpenStdin": false,
            "StdinOnce": false,
            "Env": null,
            "Cmd": null,
            "Image": "",
            "Volumes": null,
            "WorkingDir": "",
            "Entrypoint": null,
            "OnBuild": null,
            "Labels": null
        },
        "DockerVersion": "",
        "Author": "",
        "Config": {
            "Hostname": "",
            "Domainname": "",
            "User": "",
            "AttachStdin": false,
            "AttachStdout": false,
            "AttachStderr": false,
            "ExposedPorts": {
                "80/tcp": {}
            },
            "Tty": false,
            "OpenStdin": false,
            "StdinOnce": false,
            "Env": [
                "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
                "NODE_VERSION=20.5.1",
                "YARN_VERSION=1.22.19"
            ],
            "Cmd": [
                "node",
                "app.js"
            ],
            "ArgsEscaped": true,
            "Image": "",
            "Volumes": null,
            "WorkingDir": "/app",
            "Entrypoint": [
                "docker-entrypoint.sh"
            ],
            "OnBuild": null,
            "Labels": null
        },
        "Architecture": "amd64",
        "Os": "linux",
        "Size": 1101925433,
        "VirtualSize": 1101925433,
        "GraphDriver": {
            "Data": {
                "LowerDir": "/var/lib/docker/overlay2/nf1wt0hheq3mmy538xas04f51/diff:/var/lib/docker/overlay2/fmsbztm5ny1qc3y3j4h6z7uq0/diff:/var/lib/docker/overlay2/hjnf1fdb5tcpulm1wtclu4922/diff:/var/lib/docker/overlay2/538586580da0210c2f427704ff00ba136f2b0a9755625ff831f0e3263583f4d6/diff:/var/lib/docker/overlay2/5e7b6141f2d426358be9f384e55f6e153d97d3ab22c5bd3e08358e01167b893c/diff:/var/lib/docker/overlay2/b0c12d92ebeae6af0fcd75cf62d09899cdc682175457b0d64b82622efaadd121/diff:/var/lib/docker/overlay2/fbe3dd3263b7106413eaf6accc8105e95bcb15289b9cc5c16c71d456b0ab35fb/diff:/var/lib/docker/overlay2/7f70843954c2748245532e79c3026e17c74e18f1101361df53a7379317e79ec9/diff:/var/lib/docker/overlay2/752cfd83f7964ad8372ca5fc7ca07c7761109605b53dbbbf3fb7fb47cc676bd3/diff:/var/lib/docker/overlay2/aa3b0be6638d6dc10becd40adf3a03b5db3d57d1a584b67ed744f85da76c31d2/diff:/var/lib/docker/overlay2/52ac9d3365ae802edf07044b12768f290bb973975e7a37cda2ad3ca6cde75472/diff",
                "MergedDir": "/var/lib/docker/overlay2/hf9aw1qr8l7flbgrqfvd6wnw3/merged",
                "UpperDir": "/var/lib/docker/overlay2/hf9aw1qr8l7flbgrqfvd6wnw3/diff",
                "WorkDir": "/var/lib/docker/overlay2/hf9aw1qr8l7flbgrqfvd6wnw3/work"
            },
            "Name": "overlay2"
        },
        "RootFS": {
            "Type": "layers",
            "Layers": [
                "sha256:ff61a9b258e5be019eb30e2ea80b8cefaafb27360a154e5ec0e50f7b9a9cc068",
                "sha256:43ba18a5eaf87c0a4c4bf4ea6fc04d26774e8302bc20dd9b2a5e4023cb75c087",
                "sha256:6aa872026017a6174385a71ce57d72500b5acbac1e1ec168880d0028ce773ae9",
                "sha256:b485c6cd33a6678b17655f6ef5fbde009a366e207c04d59535daa61dd397bc6d",
                "sha256:59c677849659ca0bc0ee989823dbaa0d45dc91c15bc486dc342a1c0161a6a602",
                "sha256:7e98a34e8d5d70a422797373b38f1adc0d296bd0de81181771ddd1003b59a976",
                "sha256:488ed91819d9427ebd7b94c1356196fe682bb591ebf4ce23a284791d2fdabc5f",
                "sha256:cb591dd771d8de17785c9b2bc55e6eb2e29785247954a43f67294527976155e0",
                "sha256:ac219f6ccfb0a5330b8dfff6f770b9432a8d3bed1ba528f057a2cb23bf87fbb8",
                "sha256:8e1a1b27a32ffadb7daad2e0bc6ed731475dbd698f84f992d59ce38144e94ba7",
                "sha256:90da669dd0009d0fb542023895da01626194ee346228fd12a568ed878af7f9fc",
                "sha256:3785154c02ec79f3ab398f964cd83637a759fe898c6a7e65924352c4aa23886c"
            ]
        },
        "Metadata": {
            "LastTagTime": "0001-01-01T00:00:00Z"
        }
    }
]

```

```shell
docker image inspect 341640cdfda9
```

```shell-output
[
    {
        "Id": "sha256:341640cdfda98b25d39e6939fc4aa78d9d99ae8aaa9e2887244fdb21c38c5cf8",
        "RepoTags": [
            "node:latest"
        ],
        "RepoDigests": [
            "node@sha256:8d9887b3b05d2e65598a18616c37cfc271346d12248dfcbeadd7b7bf4da1e827"
        ],
        "Parent": "",
        "Comment": "",
        "Created": "2023-08-17T01:41:35.030335967Z",
        "Container": "ae77b2286d6348930f4ba225c76ebf0a1cb0d6240e871061e615a9f7d51b9360",
        "ContainerConfig": {
            "Hostname": "ae77b2286d63",
            "Domainname": "",
            "User": "",
            "AttachStdin": false,
            "AttachStdout": false,
            "AttachStderr": false,
            "Tty": false,
            "OpenStdin": false,
            "StdinOnce": false,
            "Env": [
                "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
                "NODE_VERSION=20.5.1",
                "YARN_VERSION=1.22.19"
            ],
            "Cmd": [
                "/bin/sh",
                "-c",
                "#(nop) ",
                "CMD [\"node\"]"
            ],
            "Image": "sha256:09388d0622075c333c4002ef0c074a7c7317c136dcf67989b516c6129e2cf6ee",
            "Volumes": null,
            "WorkingDir": "",
            "Entrypoint": [
                "docker-entrypoint.sh"
            ],
            "OnBuild": null,
            "Labels": {}
        },
        "DockerVersion": "20.10.23",
        "Author": "",
        "Config": {
            "Hostname": "",
            "Domainname": "",
            "User": "",
            "AttachStdin": false,
            "AttachStdout": false,
            "AttachStderr": false,
            "Tty": false,
            "OpenStdin": false,
            "StdinOnce": false,
            "Env": [
                "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
                "NODE_VERSION=20.5.1",
                "YARN_VERSION=1.22.19"
            ],
            "Cmd": [
                "node"
            ],
            "Image": "sha256:09388d0622075c333c4002ef0c074a7c7317c136dcf67989b516c6129e2cf6ee",
            "Volumes": null,
            "WorkingDir": "",
            "Entrypoint": [
                "docker-entrypoint.sh"
            ],
            "OnBuild": null,
            "Labels": null
        },
        "Architecture": "amd64",
        "Os": "linux",
        "Size": 1095566946,
        "VirtualSize": 1095566946,
        "GraphDriver": {
            "Data": {
                "LowerDir": "/var/lib/docker/overlay2/5e7b6141f2d426358be9f384e55f6e153d97d3ab22c5bd3e08358e01167b893c/diff:/var/lib/docker/overlay2/b0c12d92ebeae6af0fcd75cf62d09899cdc682175457b0d64b82622efaadd121/diff:/var/lib/docker/overlay2/fbe3dd3263b7106413eaf6accc8105e95bcb15289b9cc5c16c71d456b0ab35fb/diff:/var/lib/docker/overlay2/7f70843954c2748245532e79c3026e17c74e18f1101361df53a7379317e79ec9/diff:/var/lib/docker/overlay2/752cfd83f7964ad8372ca5fc7ca07c7761109605b53dbbbf3fb7fb47cc676bd3/diff:/var/lib/docker/overlay2/aa3b0be6638d6dc10becd40adf3a03b5db3d57d1a584b67ed744f85da76c31d2/diff:/var/lib/docker/overlay2/52ac9d3365ae802edf07044b12768f290bb973975e7a37cda2ad3ca6cde75472/diff",
                "MergedDir": "/var/lib/docker/overlay2/538586580da0210c2f427704ff00ba136f2b0a9755625ff831f0e3263583f4d6/merged",
                "UpperDir": "/var/lib/docker/overlay2/538586580da0210c2f427704ff00ba136f2b0a9755625ff831f0e3263583f4d6/diff",
                "WorkDir": "/var/lib/docker/overlay2/538586580da0210c2f427704ff00ba136f2b0a9755625ff831f0e3263583f4d6/work"
            },
            "Name": "overlay2"
        },
        "RootFS": {
            "Type": "layers",
            "Layers": [
                "sha256:ff61a9b258e5be019eb30e2ea80b8cefaafb27360a154e5ec0e50f7b9a9cc068",
                "sha256:43ba18a5eaf87c0a4c4bf4ea6fc04d26774e8302bc20dd9b2a5e4023cb75c087",
                "sha256:6aa872026017a6174385a71ce57d72500b5acbac1e1ec168880d0028ce773ae9",
                "sha256:b485c6cd33a6678b17655f6ef5fbde009a366e207c04d59535daa61dd397bc6d",
                "sha256:59c677849659ca0bc0ee989823dbaa0d45dc91c15bc486dc342a1c0161a6a602",
                "sha256:7e98a34e8d5d70a422797373b38f1adc0d296bd0de81181771ddd1003b59a976",
                "sha256:488ed91819d9427ebd7b94c1356196fe682bb591ebf4ce23a284791d2fdabc5f",
                "sha256:cb591dd771d8de17785c9b2bc55e6eb2e29785247954a43f67294527976155e0"
            ]
        },
        "Metadata": {
            "LastTagTime": "0001-01-01T00:00:00Z"
        }
    }
]

```

## `Image` Layers & Commands

Since images build on top of each other, we can see shared values between these 2 images:

1. Custom Image
```shell-example
...
            "Cmd": [
                "node",
                "app.js"
            ],
...
        "RootFS": {
            "Type": "layers",
            "Layers": [
                "sha256:ff61a9b258e5be019eb30e2ea80b8cefaafb27360a154e5ec0e50f7b9a9cc068", // START: "FROM" node
                "sha256:43ba18a5eaf87c0a4c4bf4ea6fc04d26774e8302bc20dd9b2a5e4023cb75c087",
                "sha256:6aa872026017a6174385a71ce57d72500b5acbac1e1ec168880d0028ce773ae9",
                "sha256:b485c6cd33a6678b17655f6ef5fbde009a366e207c04d59535daa61dd397bc6d",
                "sha256:59c677849659ca0bc0ee989823dbaa0d45dc91c15bc486dc342a1c0161a6a602",
                "sha256:7e98a34e8d5d70a422797373b38f1adc0d296bd0de81181771ddd1003b59a976",
                "sha256:488ed91819d9427ebd7b94c1356196fe682bb591ebf4ce23a284791d2fdabc5f",
                "sha256:cb591dd771d8de17785c9b2bc55e6eb2e29785247954a43f67294527976155e0", // END: "FROM" node
                "sha256:ac219f6ccfb0a5330b8dfff6f770b9432a8d3bed1ba528f057a2cb23bf87fbb8", // START: Docker file
                "sha256:8e1a1b27a32ffadb7daad2e0bc6ed731475dbd698f84f992d59ce38144e94ba7",
                "sha256:90da669dd0009d0fb542023895da01626194ee346228fd12a568ed878af7f9fc",
                "sha256:3785154c02ec79f3ab398f964cd83637a759fe898c6a7e65924352c4aa23886c" // END: Docker file
            ]
        }
...
```

2. Node Base Image
```shell-example
...
            "Cmd": [
                "node"
            ],
...
        "RootFS": {
            "Type": "layers",
            "Layers": [
                "sha256:ff61a9b258e5be019eb30e2ea80b8cefaafb27360a154e5ec0e50f7b9a9cc068",
                "sha256:43ba18a5eaf87c0a4c4bf4ea6fc04d26774e8302bc20dd9b2a5e4023cb75c087",
                "sha256:6aa872026017a6174385a71ce57d72500b5acbac1e1ec168880d0028ce773ae9",
                "sha256:b485c6cd33a6678b17655f6ef5fbde009a366e207c04d59535daa61dd397bc6d",
                "sha256:59c677849659ca0bc0ee989823dbaa0d45dc91c15bc486dc342a1c0161a6a602",
                "sha256:7e98a34e8d5d70a422797373b38f1adc0d296bd0de81181771ddd1003b59a976",
                "sha256:488ed91819d9427ebd7b94c1356196fe682bb591ebf4ce23a284791d2fdabc5f",
                "sha256:cb591dd771d8de17785c9b2bc55e6eb2e29785247954a43f67294527976155e0"
            ]
        }
...
```