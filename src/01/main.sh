#!/bin/bash

source ./check.sh
source ./creation_process.sh

function main {
    check "$@"
    MemoryCheck
    creation "$@"
}
main "$@"
