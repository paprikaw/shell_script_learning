#!/bin/bash
while getopts ":d:" opt; do
    case ${opt} in
    :) # Sync for server side
        echo "Invalid option: $OPTARG needs an argument"
        exit 1
        ;;
    d)
        DOMAIN=$OPTARG
        ;;
    \?)
        print_usage
        echo "Invalid option: $OPTARG" #There is no match flags
        exit 1
        ;;
    esac
done
if [[ -z "${HOST}" ]] || [[ -z "${DOMAIN}" ]]; then
    exit 1
else
    ssh $REMOTE_SSH "bash -s" < v2ray-server-autoconfigure.sh $DOMAIN
fi
