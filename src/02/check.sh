#!/bin/bash

function param_check {
    export arg_counter
    export letters_dirs
    export letters_files
    export size

    if [[ $arg_counter -ne 3 ]]; then
        echo "Program starts with 3 parameters"
        exit 1
    fi

    reg='^[a-zA-Z]{1,7}$'
    if ! [[ $letters_dirs =~ $reg ]]; then
        echo "Incorrect folder name"
        echo "No more than 7 characters!"
        exit 1
    fi

    reg='^[a-zA-Z]{1,7}[.][a-zA-Z]{1,3}$'
    if ! [[ $letters_files =~ $reg ]]; then
        echo "Enter the list of English alphabet letters"
        echo "No more than 7 characters for the name"
        echo "No more than 3 characters for the extension"
        echo "Example: az.az"
        exit 1
    fi

    reg='^[1-9][0-9]?[0]?Mb$'
    if ! [[ $size =~ $reg ]]; then
        echo "File size should be between 1 and 100Mb"
        exit 1
    else
        size=$(echo "$size" | awk -F"Mb" '{print $1}')
    fi
}
