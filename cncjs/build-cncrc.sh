#!/bin/bash

if [ "$1" == "--cncrc" ]; then
    cncrc=1
    shift
else
    cncrc=0
fi

if [ "$cncrc" == 1 ]; then
cat <<EOF
{
    "state": {
        "checkForUpdates": true,
        "controller": {
            "exception": {
                "ignoreErrors": false
            }
        }
    },
    "secret": "\$2a\$10\$wzsxrunfn5euI2J6NqzxwO",
    "macros": 
EOF
fi

echo "["
comma=""
for i in $*
do
    if [ -n "$comma" ]; then echo "$comma"; fi
    sed '/^[]\[]$/d' $i
    comma=","
done
echo "]"

if [ "$cncrc" == 1 ]; then
    echo "}"
fi
