#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" || exit

START_OF_COLOR="\033[37;"
GREEN=$START_OF_COLOR"42m"
YELLOW=$START_OF_COLOR"43m"
RED=$START_OF_COLOR"41m"
END_OF_COLOR="\033[0m"

while [ "$#" -gt 0 ]; do
    case "$1" in
    --status)
        shift
        STATUS=$1
        shift
        ;;
    --*)
        printf "$RED%s$END_OF_COLOR\n" "Unrecognized Flag"
        exit 1
        ;;
    *)
        MESSAGE=$1
        shift
        ;;
    esac
done

[ -z "$STATUS" ] && STATUS="default"

case $STATUS in
"info"|"Info"|"INFO")
    printf "$GREEN%s$END_OF_COLOR\n" "$MESSAGE"
    ;;
"warn"|"Warn"|"WARN")
    printf "$YELLOW%s$END_OF_COLOR\n" "$MESSAGE"
    ;;
"error"|"Error"|"ERROR")
    printf "$RED%s$END_OF_COLOR\n" "$MESSAGE"
    ;;
"default"|"Default"|"DEFAULT")
    printf "%s\n" "$MESSAGE"
    ;;
*)
    printf "$RED%s$END_OF_COLOR\n" "Unrecognized Status"
    ;;
esac
