#!/bin/bash

logpath=/home/student/DO4_LinuxMonitoring_v2.0-0/src/02/
export size
export letters_dirs
export letters_files

function start {
    touch logFile02.log
    START=$(date +'%s%N')
    START_TIME=$(date +'%Y-%m-%d %H:%M:%S')
    echo "Script started at $START_TIME" >logFile02.log
    echo "Script started at $START_TIME"
    count_dirs=$(echo $((1 + RANDOM % 100)))
    exeption_folders='\/[s]?bin'
    for ((number = 0; number < count_dirs; number++)); do
        cd /
        path="/"
        dir_name=""
        create_dir
    done
    stop_script
}

function create_dir {
    count_dirs_in_current_dir=$(echo "$(ls -l -d */ 2>/dev/null | wc -l)")

    if [[ $count_dirs_in_current_dir -eq 0 ]]; then
        random_number=0
    else
        random_number=$(echo $((RANDOM % count_dirs_in_current_dir)))
    fi

    if [[ $random_number -eq 0 ]]; then
        if [[ ${#letters_dirs} -lt 5 ]]; then
            mkdir_with_short_name
        else
            mkdir_normal_size_name
        fi
        sudo mkdir $path"$dir_name" 2>"$logpath"error.txt
        if ! [[ -s "$logpath"error.txt ]]; then
            echo $path"$dir_name" --- "$(date +'%Y-%m-%d %H:%M:%S')" --- >>"$logpath"logFile02.log
            create_files
        fi
    else
        path+="$(ls -ld */ | awk '{print $9}' | sed -n "$random_number"p)"
        if ! [[ $path =~ $exeption_folders ]]; then
            cd "$path" || exit
            create_dir
        fi
    fi
}

function mkdir_with_short_name {
    count=${#letters_dirs}
    for ((i = 0; i < 6 - count; i++)); do
        dir_name+="$(echo "${letters_dirs:0:1}")"
    done
    dir_name+="$(echo "${letters_dirs:1:${#letters_dirs}}")"
    dir_name+=$number
    dir_name+="_"
    dir_name+=$(date +"%d%m%y")
}

function mkdir_normal_size_name {
    dir_name=$letters_dirs
    dir_name+=$number
    dir_name+="_"
    dir_name+=$(date +"%d%m%y")
}

function create_files {
    file_name_letters="$(echo "$letters_files" | awk -F "." '{print $1}')"
    file_name_format="$(echo "$letters_files" | awk -F "." '{print $2}')"
    count_files=$(echo $((RANDOM % 100)))
    for ((number_files = 0; number_files < count_files; number_files++)); do
        file_name=""
        if [[ ${#file_name_letters} -lt 5 ]]; then
            if ! [[ -s "$logpath"error1.txt ]]; then
                create_files_with_short_name
                echo "$path""$dir_name""/""$file_name" --- "$(date +'%Y-%m-%d %H:%M:%S')" --- "$size" "Mb" >>"$logpath"logFile02.log
            else
                rm -rf "$logpath"error1.txt
                break
            fi
        else
            if ! [[ -s "$logpath"error1.txt ]]; then
                create_files_with_normal_size_name
                echo "$path""$dir_name""/""$file_name" --- "$(date +'%Y-%m-%d %H:%M:%S')" --- "$size" "Mb" >>"$logpath"logFile02.log
            else
                rm -rf "$logpath"error1.txt
                break
            fi
        fi
    done
}

function create_files_with_short_name {
    count=${#file_name_letters}
    for ((i = 0; i < 6 - count; i++)); do
        file_name+="$(echo "${file_name_letters:0:1}")"
    done
    file_name+="$(echo "${file_name_letters:1:${#file_name_letters}}")"
    file_name+=$number_files
    file_name+="_"
    file_name+=$(date +"%d%m%y")
    file_name+="."
    file_name+=$file_name_format
    sudo fallocate -l "$size""MB" "$path"/"$dir_name"/"$file_name" 2>"$logpath"error1.txt
    if [[ $(df / -BM | grep "/" | awk -F"M" '{ print $3 }') -le 8192 ]]; then
        stop_script
        exit 1
    fi
}

function create_files_with_normal_size_name {
    file_name+="$(echo "${file_name_letters:-1:${#file_name_letters}}")"
    file_name+=$number_files
    file_name+="_"
    file_name+=$(date +"%d%m%y")
    file_name+="."
    file_name+=$file_name_format
    if [[ $(df / -BM | grep "/" | awk -F"M" '{ print $3 }') -le 1024 ]]; then
        stop_script
        exit 1
    fi
}

function stop_script {
    rm -rf "$logpath"error.txt
    rm -rf "$logpath"error1.txt
    END=$(date +'%s%N')
    END_TIME=$(date +'%Y-%m-%d %H:%M:%S')
    echo "Script finished at $END_TIME" >>"$logpath"logFile02.log
    echo "Script finished at $END_TIME"
    Duration=$(((END - START) / 100000000))
    echo "Script execution time (in seconds) = $((Duration / 10)).$((Duration % 10))" >>"$logpath"logFile02.log
    echo "Script execution time (in seconds) = $((Duration / 10)).$((Duration % 10))"
    echo -e "" >>"$logpath"logFile02.log
}
