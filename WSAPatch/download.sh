#!/bin/bash

function csv_parser() {
    while IFS="," read -r filename url
    do
        $2 "$filename" "$url"
    done <"$1"
}

function executor() {
    curl -L --output "$1" "$2"
}

function main() {
    if [[ "$1" == "" ]]; then
        echo "No parameter specified"
        exit 1
    fi

    csv_parser $1 "executor"
}


main $@
