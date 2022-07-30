#!/bin/bash
RED="\e[31m"
GREEN="\e[32m"
ENDCOLOR="\e[0m"
# Help
help()
{
    echo -e "${RED}Usages${ENDCOLOR}"
    echo -e "${GREEN}bash wp-wordlist "plugin" > plugins.txt ${ENDCOLOR}" 
    echo -e "${GREEN}bash wp-wordlist "theme" > theme.txt ${ENDCOLOR}"
    echo -e "${RED}Fuff your Target"
    echo -e "${GREEN}fuff -w theme.txt -u https://Target.com/wp-content/plugins/FUZZ/readme.txt${ENDCOLOR}"
    echo -e "${GREEN}fuff -w theme.txt -u https://Target.com/wp-content/plugins/FUZZ/readme.txt${ENDCOLOR}"
}
help
while getopts ":h" option; do
   case $option in
      h) # display Help
         Help
         help;;
     \?) # incorrect option
         echo -e "${RED}Error: Invalid option"
         exit;;
   esac
done
wp-wordlist()
{
    option="$1"
    if [[ "$option" == *"plugin"* ]]; then
        curl -s https://plugins.svn.wordpress.org/ | tail -n +5 | sed -e 's/<[^>]*>//g' -e 's/\///' -e 's/ \+//gp' | grep -v "Powered by Apache" | sort -u
    elif [[ "$option" == *"theme"* ]]; then
     curl -s https://themes.svn.wordpress.org/ | tail -n +5 | sed -e 's/<[^>]*>//g' -e 's/\///' -e 's/ \+//gp' | grep -v "Powered by Apache" | sort -u
    fi
}
wp-wordlist "$1" 
