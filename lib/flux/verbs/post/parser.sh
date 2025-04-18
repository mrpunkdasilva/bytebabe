#!/bin/bash

parse_post_args() {
    local params=""
    local loading_style="default"

    while [[ $# -gt 0 ]]; do
        case "$1" in
            -H|--header)
                params+=" -H '$2'"
                shift 2
                ;;
            -d|--data)
                params+=" -d '$2'"
                shift 2
                ;;
            --json)
                params+=" -H 'Accept: application/json'"
                shift
                ;;
            --loading-style)
                loading_style="$2"
                shift 2
                ;;
            *)
                echo -e "${CYBER_RED}Error: Unknown option '$1'${RESET}"
                show_post_help
                return 1
                ;;
        esac
    done

    echo "$params|$loading_style"
}