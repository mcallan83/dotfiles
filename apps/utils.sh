#!/usr/bin/env bash

# ask for confirmation
function confirm() {
    read -r -p "$1 [Yy]:"
    case $(echo "$REPLY" | tr '[:upper:]' '[:lower:]') in
        y|yes) ;;
        *)     echo "Skipping." && exit 0 ;;
    esac
}
