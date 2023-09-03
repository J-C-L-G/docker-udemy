# Interactive Mode

When `building` or `starting` containers, there are times, where we need to interact with the container, when we are in 
`attached` mode,  we can listen for **output** from the container's `stdout` but we can't provide **input** to it, 
for applications that expect input from the `stdin` we can run `-i` **interactive** mode.

Creating and running a container (`attached` mode by default) that requires input from the user `docker run [image:name/id]`

```shell
docker build .
```

```shell-output
docker images
REPOSITORY   TAG       IMAGE ID       CREATED          SIZE
<none>       <none>    6e8835357e5c   33 seconds ago   1.01GB
```

```shell
docker run 6e8835357e5c
```
We will see the following error:

```shell-output
Please enter the min number: Traceback (most recent call last):
  File "/app/rng.py", line 3, in <module>
    min_number = int(input('Please enter the min number: '))
                     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
EOFError: EOF when reading a line

```

## `Attached` Mode listening for `Input`

Previously, we ran in `attached` mode listening for `output` but unable ot provide `input`, to allow `input` we can 
use `docker run -it  [image:name/id]`

- `-i / --interactive`    That keeps the STDIN along with
- `-t / --tty`            That simulates a terminal to allow user input

```shell-output
docker run -it 6e8835357e5c
Please enter the min number: 1
Please enter the max number: 10
9
```

# Re-running a `Stopped` Container in `attached` mode (not default)
We can restart the same container and `attached` to it `docker start -a [container:name/id]`

```shell-output
docker ps -a
CONTAINER ID   IMAGE          COMMAND                  CREATED         STATUS                      PORTS     NAMES
5510dd2cbfd8   6e8835357e5c   "python rng.py"          2 minutes ago   Exited (0) 30 seconds ago             unruffled_blackburn
```

```shell
docker start -a 5510dd2cbfd8
```

However, this will allow to start in `attached` mode but any input won't be listened by the container, 
in order to send `input` to the container's `STDIN`, we need to start in `attached` and in `interactive` mode 
using `docker start -a -i [container:name/id]`

```shell-ouput
CONTAINER ID   IMAGE          COMMAND                  CREATED          STATUS                        PORTS     NAMES
5510dd2cbfd8   6e8835357e5c   "python rng.py"          5 minutes ago    Exited (137) 30 seconds ago             unruffled_blackburn
```

```shell
docker start -a -i 5510dd2cbfd8
```

```shell-output
docker start -a -i 5510dd2cbfd8
Please enter the min number: 100
Please enter the max number: 200
143
```
>NOTE: This will execute the container, listen for input, complete the execution and stop the container (app completed).
