#!/bin/bash

function check {
    export count_var
    export option

    if [[ ${count_var} -ne 1 ]]; then
        echo "Input only 1 parameter"
        exit 1
    fi

    if [[ ${option} -gt 3 || ${option} -lt 1 ]]; then
        echo "Choose 1 argument from 1 to 3"
        exit 1
    fi

    if [[ $option -eq 1 ]]; then
        clean1
    elif [[ $option -eq 2 ]]; then
        clean2
    elif [[ $option -eq 3 ]]; then
        clean3
    fi
}
