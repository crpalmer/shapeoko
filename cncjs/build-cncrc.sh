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
bracket=""
for i in $*
do
    echo >&2 "$i..."
    if [ -n "$bracket" ]; then echo "$bracket"; fi
    echo "        {"
    if [ "$cncrc" == 1 ]; then
        echo "            \"id\": \"`uuidgen`\","
        echo "            \"mtime\": \"`stat --format=%Y $i`000\","
    fi
    echo "            \"name\": \"`echo $i | sed 's/_/ /g' | sed 's/.txt$//'`\","
    echo "            \"content\": `jq -Rsa < $i`"
    bracket="        },"
done

cat <<EOF 
        }
    ]
EOF

if [ "$cncrc" == 1 ]; then
    echo "}"
fi
