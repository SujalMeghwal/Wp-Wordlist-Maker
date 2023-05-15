#!/bin/bash

# Color variables
RED="\e[31m"
GREEN="\e[32m"
ENDCOLOR="\e[0m"

# Help function
help() {
    echo -e "${RED}Usage:${ENDCOLOR}"
    echo -e "${GREEN}bash wp-wordlist.sh [option] [output_file]${ENDCOLOR}"
    echo -e "${RED}Options:${ENDCOLOR}"
    echo -e "${GREEN}-p, --plugin\tGenerate a wordlist of WordPress plugins${ENDCOLOR}"
    echo -e "${GREEN}-t, --theme\tGenerate a wordlist of WordPress themes${ENDCOLOR}"
    echo -e "${GREEN}-h, --help\tDisplay this help message${ENDCOLOR}"
}

# Generate WordPress wordlist
wp_wordlist() {
    option="$1"
    output_file="$2"

    if [[ "$option" == "plugin" ]]; then
        curl -s https://plugins.svn.wordpress.org/ | tail -n +5 | sed -e 's/<[^>]*>//g' -e 's/\///' -e 's/ \+//gp' | grep -v "Powered by Apache" | sort -u > "$output_file"
    elif [[ "$option" == "theme" ]]; then
        curl -s https://themes.svn.wordpress.org/ | tail -n +5 | sed -e 's/<[^>]*>//g' -e 's/\///' -e 's/ \+//gp' | grep -v "Powered by Apache" | sort -u > "$output_file"
    else
        echo -e "${RED}Invalid option.${ENDCOLOR}"
        help
        exit 1
    fi
}

# Parse command-line arguments
if [ $# -eq 0 ]; then
    help
    exit 1
fi

while [[ $# -gt 0 ]]; do
    key="$1"

    case $key in
        -p|--plugin)
            output_file="$2"
            wp_wordlist "plugin" "$output_file"
            echo -e "${GREEN}WordPress plugin wordlist generated successfully in '$output_file'.${ENDCOLOR}"
            exit 0
            ;;
        -t|--theme)
            output_file="$2"
            wp_wordlist "theme" "$output_file"
            echo -e "${GREEN}WordPress theme wordlist generated successfully in '$output_file'.${ENDCOLOR}"
            exit 0
            ;;
        -h|--help)
            help
            exit 0
            ;;
        *)
            echo -e "${RED}Invalid option.${ENDCOLOR}"
            help
            exit 1
            ;;
    esac

    shift
done
