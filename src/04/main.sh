#!/bin/bash

if [[ "$#" -ne 0 ]]; then
    echo "This program doesn't take any parameters"
    exit 1
else
    source ./log_generator.sh

    percentage=0
    loading=""
    clear
    echo -e "$(tput setaf 3)Start generating ...$(tput sgr0)"
    for ((i = 1; i <= 5; i++)); do
        numberStr=$(shuf -i 100-1000 -n 1)
        LogName="nginx${i}.log"
        date=$(randomDate)

        for ((j = 1; j <= numberStr; j++)); do
            bytes_sent=$(shuf -i 1-1024 -n 1)
            echo -e "$(randomIP) " - "$(randomUser)" " [$(randomTime "$date")] \"$(methods) $(randomURL) $(randomProtocol)\" $(responseCode) $bytes_sent \"$(randomReferer)\" \"$(agents)\" " >>temp
        done
        sort -k 4 temp >>$LogName
        if [ -f temp ]; then
            clear
            ((percentage += 20))
            loading+="*****"
            echo -e "$(tput setaf 3)""$percentage% $loading $(tput sgr0) $(tput setaf 2) $LogName" "$(tput sgr0)"
            rm -f temp
        fi
    done
fi

# 200 OK — успешный запрос. Если клиентом были запрошены какие-либо данные, то они находятся в заголовке и/или теле сообщения.
# 201 Created — в результате успешного выполнения запроса был создан новый ресурс.
# 400 Bad Request — сервер обнаружил в запросе клиента синтаксическую ошибку.
# 401 Unauthorized — для доступа к запрашиваемому ресурсу требуется аутентификация.
# 403 Forbidden — сервер понял запрос, но он отказывается его выполнять из-за ограничений в доступе для клиента к указанному ресурсу.
# 404 Not Found —  Сервер понял запрос, но не нашёл соответствующего ресурса по указанному URL. Основная причина — ошибка в написании адреса Web-страницы.
# 500 Internal Server Error — любая внутренняя ошибка сервера, которая не входит в рамки остальных ошибок класса.
# 501 Not Implemented — сервер не поддерживает возможностей, необходимых для обработки запроса.
# 502 Bad Gateway — сервер, выступая в роли шлюза или прокси-сервера, получил недействительное ответное сообщение от вышестоящего сервера.
# 503 Service Unavailable — сервер временно не имеет возможности обрабатывать запросы по техническим причинам (обслуживание, перегрузка и прочее).
