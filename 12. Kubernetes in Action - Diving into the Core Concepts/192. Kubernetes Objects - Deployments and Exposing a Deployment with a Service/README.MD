# Kubernetes Objects 
Are persistent entities in the Kubernetes system. Kubernetes uses these entities to represent the state of your cluster.

Some Examples are:
- Pods
- Deployments
- Services
- Volumes

A Kubernetes object is a "record of intent" once you create the object, the Kubernetes system will constantly work to 
ensure that the object exists. By creating an object, you're effectively telling the Kubernetes system what you want 
your cluster's desired state.

## Pod
Is the smallest unit that can contain 1 (most common) or multiple containers. Pods can also contain shared resources between containers.

- Pods have a `cluster-internal` IP address.
- Containers inside a Pod can communicate via `localhost`.

For Pods to be managed for you by Kubernetes, you need a **Controller** (e.g. Deployment)

## Deployment
The Deployment object can manage (pause, delete, rollback, scale, etc) 1 or multiple Pods.

# Imperative Deployment of a `NodeJS` Application

## 1) Building Docker Image

```shell
docker build -t kub-first-app .
```
```shell-output
[+] Building 6.4s (11/11) FINISHED                                                                                                                                                                                              docker:desktop-linux
 => [internal] load .dockerignore                                                                                                                                                                                                               0.0s
 => => transferring context: 2B                                                                                                                                                                                                                 0.0s
 => [internal] load build definition from Dockerfile                                                                                                                                                                                            0.0s
 => => transferring dockerfile: 297B                                                                                                                                                                                                            0.0s
 => [internal] load metadata for docker.io/library/node:20-alpine                                                                                                                                                                               1.4s
 => [auth] library/node:pull token for registry-1.docker.io                                                                                                                                                                                     0.0s
 => [1/5] FROM docker.io/library/node:20-alpine@sha256:eb8101caae9ac02229bd64c024919fe3d4504ff7f329da79ca60a04db08cef52                                                                                                                         3.7s
 => => resolve docker.io/library/node:20-alpine@sha256:eb8101caae9ac02229bd64c024919fe3d4504ff7f329da79ca60a04db08cef52                                                                                                                         0.0s
 => => sha256:eb8101caae9ac02229bd64c024919fe3d4504ff7f329da79ca60a04db08cef52 7.67kB / 7.67kB                                                                                                                                                  0.0s
 => => sha256:cd7189aaeb7e52b85bc5d85f5929562b22d35a138407a23b288c0940086f3087 1.72kB / 1.72kB                                                                                                                                                  0.0s
 => => sha256:d9946f26513140d54bbf5dd356eafc420965a918651c0cc0c357b0f63fad9d9e 6.38kB / 6.38kB                                                                                                                                                  0.0s
 => => sha256:690e87867337b8441990047e169b892933e9006bdbcbed52ab7a356945477a4d 4.09MB / 4.09MB                                                                                                                                                  0.7s
 => => sha256:e2267a4359281c8c44596f4e05aa27db74237fa01ad7527623c080275fc9984a 42.06MB / 42.06MB                                                                                                                                                2.8s
 => => sha256:7df028aefb47eb31d48d1fc22ce31cf13760254f40331c1958f6b7062d5d6efb 1.39MB / 1.39MB                                                                                                                                                  0.4s
 => => sha256:0fac99bcf2440d55330d33f1856df74deb6cf9f92813314763ec9909a8af0eb8 443B / 443B                                                                                                                                                      0.6s
 => => extracting sha256:690e87867337b8441990047e169b892933e9006bdbcbed52ab7a356945477a4d                                                                                                                                                       0.1s
 => => extracting sha256:e2267a4359281c8c44596f4e05aa27db74237fa01ad7527623c080275fc9984a                                                                                                                                                       0.8s
 => => extracting sha256:7df028aefb47eb31d48d1fc22ce31cf13760254f40331c1958f6b7062d5d6efb                                                                                                                                                       0.0s
 => => extracting sha256:0fac99bcf2440d55330d33f1856df74deb6cf9f92813314763ec9909a8af0eb8                                                                                                                                                       0.0s
 => [internal] load build context                                                                                                                                                                                                               0.0s
 => => transferring context: 1.22kB                                                                                                                                                                                                             0.0s
 => [2/5] WORKDIR /app                                                                                                                                                                                                                          0.1s
 => [3/5] COPY package.json .                                                                                                                                                                                                                   0.0s
 => [4/5] RUN npm install                                                                                                                                                                                                                       1.1s
 => [5/5] COPY . .                                                                                                                                                                                                                              0.0s
 => exporting to image                                                                                                                                                                                                                          0.1s
 => => exporting layers                                                                                                                                                                                                                         0.1s
 => => writing image sha256:c63526ec18d4b962aaa48c203b036e26eaf7831cf28c601d1011f772c00a832e                                                                                                                                                    0.0s
 => => naming to docker.io/library/kub-first-app         
```

![docker images local.png](images%2Fdocker%20images%20local.png)


## 2) Send the `Image` to `Kubernetes` via `Deployment`

To send the instructions to the cluster to create a Pod to run this image in a container:

First we will check the cluster status:

```shell
minikube status
```

```shell-output
minikube
type: Control Plane
host: Running
kubelet: Running
apiserver: Running
kubeconfig: Configured
```

Now since is up and running, we can send the Deployment command to the cluster's master node:

```shell-example
kubectl create deployment [name] --image=[image-name]
```

```shell
kubectl create deployment first-app --image=kub-first-app
```
```shell-output
deployment.apps/first-app created
```

## 3) Debugging error while creating the `Deployment`

The deployment was created but there was a failure as 0 are ready.

```shell
kubectl get deployments
```

```shell-output
NAME        READY   UP-TO-DATE   AVAILABLE   AGE
first-app   0/1     1            0           77s
```

```shell
kubectl get pods
```

```shell-output
NAME                         READY   STATUS             RESTARTS   AGE
first-app-6fc798dbcd-mxn9s   0/1     ImagePullBackOff   0          2m49s
```

- `ImagePullBackOff` occurs when a container running in a pod fails to pull the required image from a container registry.


## 4) Fixing error while creating the `Deployment`

First we will delete the existing failed deployment:
```shell
kubectl delete deployment first-app
```

```shell-output
deployment.apps "first-app" deleted
```

Then we will publish the image to Docker Hub to make it available:

![docker-hub-repo-create.png](images%2Fdocker-hub-repo-create.png)

We will re-tag the local image:

```shell
docker tag kub-first-app jclgps/kub-first-app
docker push jclgps/kub-first-app:latest
```

```shell-output
The push refers to repository [docker.io/[account-name]]/kub-first-app]
819b8ec891ab: Pushed 
2973f4565f0e: Pushed 
7579e3f62789: Pushed 
2f256bf5ace5: Pushed 
72deda6891f4: Mounted from library/node 
e99643da769b: Mounted from library/node 
93e482f641cc: Mounted from library/node 
9110f7b5208f: Mounted from library/node 
latest: digest: sha256:32a45f52db08eaebb0d37c8bc3bcdba455933294205d538a184e962e608cf536 size: 1989
```

![docker-hub-image-pushed.png](images%2Fdocker-hub-image-pushed.png)

```shell
kubectl create deployment first-app --image=jclgps/kub-first-app
```

```shell
kubectl get deployments
```

```shell-output
NAME        READY   UP-TO-DATE   AVAILABLE   AGE
first-app   1/1     1            1           17s
```

```shell
kubectl get pods
```

```shell-output
NAME                         READY   STATUS    RESTARTS   AGE
first-app-5477d655c6-s5f9l   1/1     Running   0          57s
```

```shell
minikube dashboard
```

![minikube-dashboard-with-deployment.png](images%2Fminikube-dashboard-with-deployment.png)


![kubectl internals.png](images%2Fkubectl%20internals.png)

## 5) Exposing the `Pod` using a `Service` Object
Pods have an internal `ip` address and by default it changes when a `pod` is replaced, a `Service` group multiple 
pods with a shared `ip` that doesn't change and can be relied upon for communication.

`Services` can allow in-cluster and external access to `Pods`, the default is internal-only but services allows us 
to change this. 

```shell
kubectl create -h 
```

```shell-output
Available Commands:
  clusterrole           Create a cluster role
  clusterrolebinding    Create a cluster role binding for a particular cluster role
  configmap             Create a config map from a local file, directory or literal value
  cronjob               Create a cron job with the specified name
  deployment            Create a deployment with the specified name
  ingress               Create an ingress with the specified name
  job                   Create a job with the specified name
  namespace             Create a namespace with the specified name
  poddisruptionbudget   Create a pod disruption budget with the specified name
  priorityclass         Create a priority class with the specified name
  quota                 Create a quota with the specified name
  role                  Create a role with single rule
  rolebinding           Create a role binding for a particular role or cluster role
  secret                Create a secret using a specified subcommand
  service               Create a service using a specified subcommand
  serviceaccount        Create a service account with the specified name
  token                 Request a service account token
```

Instead of a `service` we will call `expose` to make the pod available:
- [Service Types](https://kubernetes.io/docs/concepts/services-networking/service/#publishing-services-service-types)
- [Minikube Access LB](https://minikube.sigs.k8s.io/docs/handbook/accessing/)


> **LoadBalancer**
> Exposes the Service externally using an external load balancer. Kubernetes does not directly offer a load balancing component; you must provide one, or you can integrate your Kubernetes cluster with a cloud provider.



```shell
kubectl expose deployment first-app --port=8080 --type=LoadBalancer
```

```shell-output
service/first-app exposed
```

```shell
kubectl get services
```

```shell-output
NAME         TYPE           CLUSTER-IP      EXTERNAL-IP   PORT(S)          AGE
first-app    LoadBalancer   10.99.114.115   <pending>     8080:32230/TCP   50s
kubernetes   ClusterIP      10.96.0.1       <none>        443/TCP          65d
```

```shell
minikube service first-app 
```

```shell-output
|-----------|-----------|-------------|---------------------------|
| NAMESPACE |   NAME    | TARGET PORT |            URL            |
|-----------|-----------|-------------|---------------------------|
| default   | first-app |        8080 | http://192.168.49.2:32230 |
|-----------|-----------|-------------|---------------------------|
🏃  Starting tunnel for service first-app.
|-----------|-----------|-------------|------------------------|
| NAMESPACE |   NAME    | TARGET PORT |          URL           |
|-----------|-----------|-------------|------------------------|
| default   | first-app |             | http://127.0.0.1:61369 |
|-----------|-----------|-------------|------------------------|
🎉  Opening service default/first-app in default browser...
❗  Because you are using a Docker driver on darwin, the terminal needs to be open to run it.
```

- http://127.0.0.1:61369

![node-js-app-kubernetes-deployed.png](images%2Fnode-js-app-kubernetes-deployed.png)

```js
app.get('/', (req, res) => {
  res.send(`
    <h1>Hello from this NodeJS app!</h1>
    <p>Try sending a request to /error and see what happens</p>
  `);
});
```