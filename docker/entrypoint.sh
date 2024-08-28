#!/bin/bash

trap "" SIGINT SIGTERM SIGKILL

DEV=false

while getopts "d" flag
do
    case "${flag}" in
        d) DEV=true;;
        *) echo "Invalid flag ${flag}"
    esac
done

NODE_MEMORY_LIMIT=$((K8S_MEMORY_LIMIT / 1024 / 1024))
export NODE_OPTIONS="--max-old-space-size=${NODE_MEMORY_LIMIT}"

if [ "$DEV" = true ]
then
node_modules/.bin/nodemon --trace-warnings --inspect=0.0.0.0:9229 ./bin/www.js --watch . --ext js
else
node ./bin/www.js
fi