#!/bin/bash

# Make sure user is defined in /etc/passwd

if ! whoami > /dev/null 2>&1; then
  if [ -w /etc/passwd ]; then
    echo "${USER_NAME:-default}:x:$(id -u):0:${USER_NAME:-default} user:${HOME}:/sbin/nologin" >> /etc/passwd
  fi
fi

# Loading environment configuration
if [ -d /home/oipconfig ] && [ -n "$(ls -A /home/oipconfig)" ]; then
  for f in /home/oipconfig/*; do
    . $f
  done
fi

# Run the command specified by the user
exec $@
