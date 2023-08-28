FROM node

# All subsequent commands will be executed from this working directory
WORKDIR /app

# [Host Machine] [Image/Container FS] <- From working directory or root if whole path is provided like here.
COPY .. /app

# Run command in the image (from root or workdir if provided)
RUN npm install

# This would be incorrect since the image should be only the blue print and not execution
#RUN node app.js

# This instructs docker to expose an internal port fromt he container to the local machine
# (ONLY FOR DOCUMENTATION *Optional*) to use the port we need to execute with the -p flag
EXPOSE 80

# This will run when the container is created rathen than when the image is created.
# If no CMD is specified the CMD commands of the base image will be executed, with no base image and no CMD it will fail
CMD ["node", "app.js"]
