#!/bin/sh
printf "Skrypt na zaliczenie 4 labolatorium z Narzędzi pracy w branży IT - Krzysztof Hager 52687\n\n"

help(){
    printf "skrypt.sh - Skrypt na zaliczenie: Krzysztof Hager 52687\n\n"
    printf "Użycie: ./skrypt.sh <flaga> <opcjonalny argument>\n\n"
    printf "Dostępne flagi:\n"
    printf -- "--help -h Wyświetla tę wiadomość.\n"
    printf -- "--date -d Wyświetla aktualną datę.\n"
    printf -- "--logs -l <liczba> Tworzy folder logs oraz <liczba> plików logs/log<i>.txt, zawierających informacie o dacie, skrypcie oraz numerze loga. Jeśli <liczba> nie zostanie podana lub argument będzie niepoprawny, zostanie domyślnie utworzone 100 logów.\n\n"
}

logs(){
    if [[ "$1" =~ ^[0-9]+$ ]] && [[ "$1" -gt 0 ]] && [[ ! -z "$1" ]]; then
        index="$1"
    else
        index=100
    fi

    for i in $(seq 1 $index)
    do
        name="log$i.txt"
        printf "$name\n$0\n$(date)" > "$name"
    done
}

init(){
    git clone https://github.com/Kszyszka/narzedzia-w-it-lab4.git .
    # Może zakończyć się błędami jeśli folder nie jest pusty, ale zgodnie z zadaniem klonuje do aktualnej lokacji
    export PATH="$(pwd):$PATH"
    # Dodaje do PATH tylko tymczasowo aby nie bruździć w zmiennej podczas developmentu
    echo $PATH
}

error(){
    if [[ "$1" =~ ^[0-9]+$ ]] && [[ "$1" -gt 0 ]] && [[ ! -z "$1" ]]; then
        index="$1"
    else
        index=100
    fi

    for i in $(seq 1 $index)
    do
        name="error$i.txt"
        mkdir "error$i"
        printf "$name\n$0\n$(date)" > "./error$i/$name"
    done
}

case "$1" in
    "--date") date ;;
    "-d") date;;
    "--logs") logs "$2";;
    "-l") logs "$2";;
    "--init") init;;
    "--error") error "$2";;
    "-e") error "$2";;
    "--help") help ;;
    "-h") help;;
    *) help ;;
esac