#!/bin/sh

# When building or starting container there are times where we want to interact with the container, when we are attached
# we can listen for output from the containers stdout but we can't provide input to it, for application that expect
# input from the stdin we can run -i interactive mode.

# Creating and running the container (attach mode by default) that requires input from the user
docker build .
docker run [image:name/id]

# We will see the following error:

#Please enter the min number: Traceback (most recent call last):
#  File "/app/rng.py", line 3, in <module>
#    min_number = int(input('Please enter the min number: '))
#EOFError: EOF when reading a line

# We ran in attach mode listening for output but unable ot provide input, to allow input we can use
# -i / --interactive    That keeps the STDIN along with
# -t / --tty            That simulates a terminal to allow user input
docker run -it  [image:name/id]

# Rerunning the stopped container in attach mode (not default)
docker start -a [container:name/id]

# However this will allow to start in attached mode but any input wont be listened by the container
# in order to send input to it we need to start attached and in interactive mode
docker start -a -i [container:name/id]

# This will execute the container, listen for input, complete the execution and stop the container (app completed)
