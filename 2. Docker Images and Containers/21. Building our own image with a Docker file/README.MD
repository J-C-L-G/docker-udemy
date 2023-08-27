# Building a Docker File (Image Setup)
It contains the instructions for Docker that should be executed
while building a custom image.

## 1. Selecting the base

````dockerfile
FROM node
````
This allows to build on top of an existing image, in this example from  `node`.

## 2. Content of the image
Copy from `"Host Machine"` to  `"Image/Container File System"` considering the working 
directory or root if whole path is provided.

````dockerfile
COPY . .
````
>NOTE: This will copy all files from current directory where the "Docker" file is placed excluding it.

As a better alternative, we will move all the files needed from our local file system into an specific folder named `app` inside the `image` and `container`.
````dockerfile
COPY . ./app
````

## 3. Running a `command` in the image
All the commands are executed in the working directory, which by default is the image/container root directory.

Since we copied the code inside `/app` we will change working directory as:

````dockerfile
WORKDIR /app
````

Now, with this change, we could update our paths as:

**WORKDIR Relative** 
````dockerfile
COPY . ./
````

**WORKDIR Absolute**
````dockerfile
COPY . /app
````

Now, with the correct folder structure and working directory:

````dockerfile
RUN npm install
````

## 4. Running the Code
If we include the command to execute the code as following:

````dockerfile
RUN node server.js
````
This step will try to start the server while generating the `image`, 
which is incorrect, as this should only be the template that allows to spawn
multiple container that should be the ones where the code is executed.

Here, we can use `CMD` that allows to execute command when the container is executed:

````dockerfile
CMD ["node", "app.js"]
````
>NOTE: If no `CMD` is specified the `CMD` commands of the base `image` will be executed,
> if there aren't `CMD` in the base `image` and no `CMD` in the Docker file, it will fail.


## 5. Exposing the Container Internal Port
A container is isolated from our local environment, in order to reach the internal application port, 
we need to expose it in our Docker file

````dockerfile
EXPOSE 80
````


## 6. Final Docker File

````dockerfile
FROM node
WORKDIR /app
COPY . /app
RUN npm install
EXPOSE 80
CMD ["node", "app.js"]
````