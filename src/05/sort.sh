#!/bin/bash

function sort_response_code {
    for ((i = 1; i < 6; i++)); do
        sort -k 9 ../04/nginx"$i".log -o search1_"$i".log
    done
}

function sort_unique_IPs {
    for ((i = 1; i < 6; i++)); do
        awk '{print $1}' ../04/nginx"$i".log | uniq >search2_"$i".log
    done
}

function error_sort {
    for ((i = 1; i < 6; i++)); do
        awk '$9 ~ /[45][0-9][0-9]/' ../04/nginx"$i".log >search3_"$i".log
    done
}

function sort_erroneous_IPs {
    for ((i = 1; i < 6; i++)); do
        awk '($9 ~ /50*/ || $9 ~ /40*/)' ../04/nginx"$i".log | sort -uk 1 | awk '{print $1"  \t "$9}' | uniq >search4_"$i".log
    done
}
