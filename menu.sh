#!/bin/bash

function show_menu {
    clear
    echo "**************************"
    echo "*       Termux Tool       *"
    echo "**************************"
    echo "[01] Random Gmail"
    echo "[02] Çıkış"
    echo -n "Bir seçenek girin: "
}

function random_email {
    domains=("gmail.com" "yahoo.com" "hotmail.com")
    name_length=$((RANDOM % 5 + 5))
    name=$(tr -dc 'a-z0-9' < /dev/urandom | head -c $name_length)
    domain=${domains[$((RANDOM % ${#domains[@]}))]}
    echo "$name@$domain"
}

function generate_emails {
    count=$1
    for ((i=1; i<=count; i++)); do
        random_email
    done
}

function process_option {
    case $1 in
        1)
            echo "Rastgele 50 Gmail adresi oluşturuluyor..."
            generate_emails 50
            ;;
        2)
            echo "Çıkılıyor..."
            exit 0
            ;;
        *)
            echo "Geçersiz seçenek. Lütfen tekrar deneyin."
            ;;
    esac
}

while true; do
    show_menu
    read -r choice
    process_option "$choice"
    echo -n "Devam etmek için Enter'a basın..."
    read
done
