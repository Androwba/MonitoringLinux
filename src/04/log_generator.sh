#!/bin/bash

randomIP() {
    genIp=$(shuf -i 1-255 -n 1).$(shuf -i 1-255 -n 1).$(shuf -i 1-255 -n 1).$(shuf -i 1-255 -n 1)
    echo "$genIp"
}

randomUser() {
    username=("$USER" "james" "robert" "michael" "somebody" "elizabeth" "rebecca" "william" "jennifer" "patricia" "christopher")
    numberRU=$(shuf -i 1-${#username[@]} -n 1)
    echo "${username[$numberRU - 1]}"
}

randomDate() {
    genDate=$(date -d "2000-01-01 + $(shuf -i 1-797468400 -n 1) sec" +'%Y-%m-%d')
    echo "$genDate"
}

randomTime() {
    genTime=$(date -d "$1 + $(shuf -i 1-86400 -n 1) sec" +'%d/%b/%Y:%H:%M:%S %z')
    echo "$genTime"
}

methods() {
    statusCode=("GET" "POST" "PUT" "PATCH" "DELETE")
    numberSC=$(shuf -i 1-${#statusCode[@]} -n 1)
    echo "${statusCode[$numberSC - 1]}"
}

randomURL() {
    URL=("/long/link/for/example.net" "/example.org" "test.server.com" "/youtube.ru" "/example.edu/birthday.html" "/google.com" "/someaddress.html" "/school21/monitoring2.info")
    numberURL=$(shuf -i 1-${#URL[@]} -n 1)
    echo "${URL[$numberURL - 1]}"
}

randomReferer() {
    Referer=("http://www.w3.org/1999/xhtml" "https://developer.mozilla.org/en-US/docs/Web/JavaScript" "http://www.w3.org/hypertext/WWW/TheProject.html" "http://www.example.html" "http://school21.ru" "http://crnvmc.cern.ch" "http://someaddress.html")
    numberReferer=$(shuf -i 1-${#Referer[@]} -n 1)
    echo "${Referer[$numberReferer - 1]}"
}

randomProtocol() {
    protocol=("HTTP/1.0" "HTTP/1.1" "HTTP/2.0")
    numberP=$(shuf -i 1-${#protocol[@]} -n 1)
    echo "${protocol[$numberP - 1]}"
}

responseCode() {
    respStatusCode=("200" "201" "400" "401" "403" "404" "500" "501" "502" "503")
    numberRSC=$(shuf -i 1-${#respStatusCode[@]} -n 1)
    echo "${respStatusCode[$numberRSC - 1]}"
}

agents() {
    userAgent=(
        "Opera/9.80 (Windows NT 6.1; WOW64; YB/5.1.3.0) Presto/2.12.388 Version/12.16"
        "Microsoft Edge" "Mozilla/5.0 (Linux; Android 6.0.1; SM-T819 Build/MMB29M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.89 Safari/537.36"
        "Mozilla/5.0 (Linux; Android 9; JSN-L22) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.62 Mobile Safari/537.36"
        "Mozilla/5.0 (Windows NT 10.0; Trident/7.0; rv:11.0) like Gecko" "Library and net tool" "Mozilla/5.0 (Linux; Android 5.0; SM-G920A) AppleWebKit (KHTML, like Gecko) Chrome Mobile Safari (compatible; AdsBot-Google-Mobile; +http://www.google.com/mobile/adsbot.html)"
        "Mozilla/5.0 (Linux; Android 5.1; Eluga_A2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.92 Mobile Safari/537.36"
        "Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101 Firefox/45.0"
        "Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)"
        "Mozilla/5.0 (Windows NT 6.3; Trident/7.0; rv:11.0) like Gecko"
        "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36 OPR/91.0.4516.20"
        "Mozilla/5.0 (Macintosh; Intel Mac OS X 12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36 OPR/91.0.4516.20"
        "Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143 Safari/601.1"
        "Mozilla/5.0 (Linux; U; Android 5.0.2; en-US; XT1068 Build/LXB22.46-28) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/57.0.2987.108 UCBrowser/12.10.2.1164 Mobile Safari/537.36")
    numberUsAg=$(shuf -i 1-${#userAgent[@]} -n 1)
    echo "${userAgent[$numberUsAg - 1]}"
}
