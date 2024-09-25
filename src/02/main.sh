#!/bin/bash

source ./check.sh
source ./creation_process.sh

function main {
    arg_counter=${#}
    letters_dirs=${1}
    letters_files=${2}
    size=${3}

    param_check
    start
}

main "$@"
