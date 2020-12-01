#!/bin/sh

# For each command (excluding CMD) Dockers creates a layer and caches it to build/reuse if nothing changed
# in this example we can optimize and reuse the "npm install" step if we first copy the package into the
# image, if the project dependencies didn't change docker will be able to re-use the cached version of npm install;
# since most of the changes will happen in the source code, we can change the execution order and get speed up the build.

docker build .
