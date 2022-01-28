#!/bin/sh

last_ping_update=""

# only update ping once every 5 seconds
function get_div_time() {
    echo "$((`date +%s` / 5))"
}

# first 3 lines are kind of garbage
i3status | (read line && echo "$line" && read line && echo "$line" && read line && echo "$line" && while :
do
    read line

    # this ensures ping redraw when changing volume or smth
    if [ "$last_ping_update" != "`get_div_time`" ]; then

        # update every 5 seconds
        last_ping_update="`get_div_time`"
        delay="`timeout 1 ping google.com -c 1 | awk '$0 ~ /time=/ {printf "%s %s\n", substr($8, 6), $9}'`"
        if [ -z "$delay" ]; then
            ping="google: (unreachable)\", \"color\":\"#FF0000"
        else
            ping="google: $delay"
        fi
    fi

    # inject json
    echo ",[{\"full_text\":\"${ping}\", \"separator_block_width\": 40},${line#,\[}" || exit 1
done)
