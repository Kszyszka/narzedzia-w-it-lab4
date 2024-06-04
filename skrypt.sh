#!/bin/sh
printf "Skrypt na zaliczenie 4 labolatorium z Narzędzi pracy w branży IT - Krzysztof Hager 52687\n\n"

logs(){
    mkdir -p logs
    # Logi w osobnym folderze dla zachowania porządku

    if [ "$1" -gt 0 -a "$1" =~ "^[0-9]+$" ]; then
        index="$1"
    else
        index=100
    fi

    mkdir -p logs

    for i in $(seq 1 $index)
    do
        name="log$i.txt"
        printf "$name\n$0\n$(date)" > "./logs/$name"
    done
}

case "$1" in
    "--date") date ;;
    "--logs") logs "$2";;
    *) printf "Nieznana flaga." ;;
esac