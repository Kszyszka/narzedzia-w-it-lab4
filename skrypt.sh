#!/bin/sh
printf "Skrypt na zaliczenie 4 labolatorium z Narzędzi pracy w branży IT - Krzysztof Hager 52687\n\n"

logs(){
    mkdir logs
    # Logi w osobnym folderze dla zachowania porządku

    for i in {1..100}
    do
        name="log$i.txt"
        printf "$name\n$0\n$(date)" > "./logs/$name"
    done
}

case "$1" in
    "--date") date ;;
    "--logs") logs;;
    *) printf "Nieznana flaga." ;;
esac