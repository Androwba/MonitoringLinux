#!/bin/bash

function check() {
        format=$(echo "$5" | awk -F. '{print $1}')
        extension=$(echo "$5" | awk -F. '{print $2}')
        size_of_file=$(echo "$6" | awk -F"kb" '{print $1}')

        if [[ $# -ne 6 ]]; then
                echo "The script runs with 6 parameters"
                echo "Example: main.sh /opt/test 4 az 5 az.az 3kb"
                exit 1
        fi

        if [[ ! (-d $1) ]]; then
                echo "Directory does not exist!"
                exit 1
        fi

        if [[ $2 =~ [^0-9] ]]; then
                echo "Input integer in range from 1 to 100"
                exit 1
        else
                if [[ $2 -gt 100 || $2 -le 0 ]]; then
                        echo "Enter number between 1-100"
                        exit 1
                fi
        fi

        if [[ ($3 -gt 7) ]]; then
                echo "Too many! Enter up to 7 letters"
                exit 1
        else
                if [[ $3 =~ [^A-Za-z] ]]; then
                        echo "Dir name should consist only English letters"
                        exit 1
                fi
        fi

        if [[ $4 =~ [^0-9] ]]; then
                echo "Enter integer number of files to create between 1-100"
                exit 1
        else
                if [[ $4 -gt 100 ]]; then
                        echo "Too many files"
                        exit 1
                fi
        fi

        if [[ ${#format} -gt 7 || ${#extension} -gt 3 ||
                $format =~ [^A-Za-z] || $extension =~ [^A-Za-z] ||
                $extension == "" || ${#format} -lt 1 ]]; then
                echo "Wrong data!"
                echo "Example: az.az"
                exit 1
        fi

        if [[ ! ($6 =~ kb$) || ($size_of_file =~ [^0-9]) || ($size_of_file -gt 100) || ($size_of_file -le 0) ]]; then
                echo "Size of file should be between 1-100kb"
                exit 1
        fi
}

function MemoryCheck() {
        freeMemory=$(df -h / | awk 'sub(/dev/,""){printf("%d\n",$4) }')
        if [[ $freeMemory -lt 1 ]]; then
                export flag=1
                echo "Out of memory, only $freeMemory Gb left!"
        fi
}
