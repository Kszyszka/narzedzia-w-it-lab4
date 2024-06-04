#!/bin/sh
printf "Skrypt na zaliczenie 4 labolatorium z Narzędzi pracy w branży IT - Krzysztof Hager 52687\n\n"

help(){
    printf "skrypt.sh - Skrypt na zaliczenie: Krzysztof Hager 52687\n\n"
    printf "Użycie: ./skrypt.sh <flaga> <opcjonalny argument>\n\n"
    printf "Dostępne flagi:\n"
    printf -- "--help Wyświetla tę wiadomość.\n"
    printf -- "--date Wyświetla aktualną datę.\n"
    printf -- "--logs <liczba> Tworzy folder logs oraz <liczba> plików logs/log<i>.txt, zawierających informacie o dacie, skrypcie oraz numerze loga. Jeśli <liczba> nie zostanie podana lub argument będzie niepoprawny, zostanie domyślnie utworzone 100 logów.\n\n"
}

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
    "--help") help ;;
    *) help ;;
esac