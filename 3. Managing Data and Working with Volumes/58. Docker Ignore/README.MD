# Ignoring Local Files

we can include a `.dockerignore` file where we can specify to docker what should 
**not** be considered as part of the steps in the build file copy step:

```dockerfile
COPY . .
```

then:

```dockerignore
node_modules
Dockerfile
.git
```

will build the `image` without copying the files in the file mentioned in the ignore file list.
