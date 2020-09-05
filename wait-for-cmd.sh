#!/bin/sh

COMMAND=$1
TIMEOUT=${2:-5}

if [ "$COMMAND" == "" ]; then
  echo "You should provide command to wait for."
  exit 1
fi

echo "Waiting ${TIMEOUT}s for command: $COMMAND"

for i in `seq $TIMEOUT` ; do
  # see: https://unix.stackexchange.com/questions/444946/how-can-we-run-a-command-stored-in-a-variable
  eval "$COMMAND"
  if [ $? -eq 0 ]; then
    exit 0
  fi
  sleep 1
done

echo "Timeout ${TIMEOUT}s exceeded."
exit 1


