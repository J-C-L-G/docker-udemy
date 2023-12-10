# Install Docker in EC2

```shell
sudo yum update -y
```
```shell
sudo yum -y install docker
```
```shell
sudo service docker start
```

```shell
sudo usermod -a -G docker ec2-user
```

Make sure to log out + back in after running these commands.
Once you logged back in, run this command:

```shell
sudo systemctl enable docker
```

```shell-output
[ec2-user@ip-XXX-XX-XX-XXX ~]$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
```
