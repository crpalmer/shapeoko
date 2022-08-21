#!/bin/bash

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
    "macros": [
EOF

bracket=""
for i in $*
do
    echo >&2 "$i..."
    if [ -n "$bracket" ]; then echo "$bracket"; fi
    echo "        {"
    echo "            \"id\": \"`uuidgen`\","
    echo "            \"mtime\": \"`stat --format=%Y $i`000\","
    echo "            \"name\": \"`echo $i | sed 's/_/ /g' | sed 's/.txt$//'`\","
    echo "            \"content\": `jq -Rsa < $i`"
    bracket="        },"
done
cat <<EOF 
        }
    ]
}
EOF
