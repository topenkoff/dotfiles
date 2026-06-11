#!/usr/bin/env bash

pane_pid="$1"

get_descendants() {
    local pid=$1 children c
    children=$(pgrep -P "$pid" 2>/dev/null)
    for c in $children; do
        echo "$c"
        get_descendants "$c"
    done
}

ssh_line=""
for pid in $(get_descendants "$pane_pid"); do
    cmd=$(ps -o command= -p "$pid" 2>/dev/null)
    if echo "$cmd" | grep -qE '(^|/)ssh '; then
        ssh_line="$cmd"
        break
    fi
done

if [ -z "$ssh_line" ]; then
    echo "localhost"
    exit 0
fi

read -ra args <<< "$ssh_line"
host=$(ssh -G "${args[@]:1}" 2>/dev/null | awk '/^hostname /{print $2; exit}')

if [ -n "$host" ]; then
    echo "$host"
else
    echo "localhost"
fi
