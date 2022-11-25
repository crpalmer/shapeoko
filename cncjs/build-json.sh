#!/bin/bash

if [ "$#" != 1 ]; then
    echo "usage: macro.txt"
fi

echo "["
echo "        {"
echo "            \"name\": \"`echo $1 | sed 's/_/ /g' | sed 's/.txt$//'`\","
echo "            \"content\": `jq -Rsa < $1`"
echo "        }"
echo "]"
