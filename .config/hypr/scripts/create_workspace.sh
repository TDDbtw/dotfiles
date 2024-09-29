#!/bin/bash

while true; do
    read -rsn1 input
    if [ "$input" == $'\x1b' ]; then
        read -rsn1 -t 0.1 input
        if [ "$input" == $'\x1d' ]; then
            read -rsn1 -t 0.1 input
            if [[ "$input" =~ [0-9] ]]; then
                workspace_number=$input
                hyprctl workspace new $workspace_number
            fi
        fi
    fi
done

