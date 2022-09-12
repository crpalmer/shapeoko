#!/bin/sh

egrep '"name": "|"content": "' | while read name
do
    read -r content
    name=`echo "$name" | sed 's/"name": "//' | sed 's/", *$//' | sed 's/ /_/g'`".txt"
    echo $name
    ( echo '{'; cat <<<$content; echo '}') | jq -r '.content' > $name
done
