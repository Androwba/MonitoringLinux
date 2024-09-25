#!/bin/bash

function creation() {
    export format
    export size_of_file
    export extension
    arg2=$2
    arg4=$4
    flag=0
    foldersNames=$3
    LastLetterDIrName=${3: -1}
    fileName=$format
    oldFormatName=$fileName
    lastLatterOfFileName=${fileName: -1}
    date_for_dir="$(date +"%d%m%y")"
    current_date="DATE = $(date +"%d.%m.%y")"

    if [[ ${#foldersNames} -lt 4 ]]; then
        for ((i = ${#foldersNames}; i < 4; i++)); do
            foldersNames+="$LastLetterDIrName"
        done
    fi

    for ((i = 1; i <= arg2 && flag == 0; i++)); do
        MemoryCheck
        mkdir "$1/""$foldersNames""_""$date_for_dir"""
        for ((j = 1; j <= arg4 && flag == 0; j++)); do
            fallocate -l "$size_of_file" "$1/""$foldersNames""_""$date_for_dir""/""$fileName"".""$extension""_""$date_for_dir"""
            echo """$current_date"" | $1/""$foldersNames""_""$date_for_dir""/""$fileName"".""$extension""_""$date_for_dir"" |  file size = $size_of_file Kb." >>logFile
            fileName+="$lastLatterOfFileName"

        done
        fileName=$oldFormatName
        foldersNames+="$LastLetterDIrName"
    done
}
