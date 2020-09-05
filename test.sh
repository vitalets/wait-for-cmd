#!/bin/bash

check() {
  ./wait-for-cmd.sh "$1" 2
  if [ $? -ne $2 ]; then
    echo "ERROR: got exit code $? instead of $2"
    exit 1
  fi
}

check 'nc -z example.com 80 > /dev/null 2>&1' 0
check 'curl -f https://example.com > /dev/null 2>&1' 0
check 'nc -z foo 80 > /dev/null 2>&1' 1

echo 'SUCCESS'
