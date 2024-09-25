#!/bin/bash

while true; do

    cpu_usage=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1"%"}')
    ram_usage=$(free | tail -n2 | awk '{print $4 * 1024}' | sed -n '1'p)
    storage_usage=$(df / | tail -n1 | awk '{print $5}')
    cat metrics.html

    page="metrics.html"
    echo "# HELP my_cpu_usage CPU usage percent." >$page
    echo "# TYPE my_cpu_usage gauge" >>$page
    echo "Androwba_cpu ${cpu_usage%\%*}" >>$page
    echo "# HELP my_ram_usage RAM usage." >>$page
    echo "# TYPE my_ram_usage gauge" >>$page
    echo "Androwba_ram  $ram_usage" >>$page
    echo "# HELP my_storage_usage Storage usage percent." >>$page
    echo "# TYPE my_storage_usage gauge" >>$page
    echo "Androwba_storage ${storage_usage%\%*}" >>$page

    cat metrics.html

    sleep 3s
done
