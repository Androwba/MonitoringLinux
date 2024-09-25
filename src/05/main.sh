#!/bin/bash

source ./sort.sh

if ! [[ $# -eq 1 ]]; then
    echo "The program starts with 1 parameter!"
    exit 1
else
    case $1 in
    1) sort_response_code ;;
    2) sort_unique_IPs ;;
    3) error_sort ;;
    4) sort_erroneous_IPs ;;
    *) echo "Enter parameter from 1 to 4" ;;
    esac
fi
