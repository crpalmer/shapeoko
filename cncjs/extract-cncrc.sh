#!/bin/bash

egrep '"name": "|"content": "' $* | while read name
do
    read -r content
    name=`echo "$name" | sed 's/"name": "//' | sed 's/", *$//' | sed 's/ /_/g'`".txt"
    echo $name
    (
	echo '{'
	cat <<<$content | sed 's/,*$//'
	echo '}'
    ) | tee /tmp/x | jq -r '.content' \
      | sed -e '/./,$!d' -e :a -e '/^\n*$/{$d;N;ba' -e '}' \
      > $name
done
egrep '"event": "|"commands": "' $* | while read event
do
    read -r commands
    name=`echo "$event" | sed 's/"event": "//' | sed 's/", *$//'`
    if [ "$name" = "controller:ready" ]; then
       echo $name
       (
	   echo '{'
	   cat <<<$commands | sed 's/,*$//'
	   echo '}'
       ) | tee /tmp/x | jq -r '.commands' \
         | sed -e '/./,$!d' -e :a -e '/^\n*$/{$d;N;ba' -e '}' \
         > ControllerReady.txt
    fi
done
