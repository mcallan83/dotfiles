#!/bin/zsh

set -uo pipefail

NODE_VERSION=24
PHP_VERSION=8.5

if command -v brew >/dev/null 2>&1; then
	brew update
	brew upgrade
	brew cleanup
	brew doctor
fi

if command -v mise >/dev/null 2>&1; then
	mise upgrade "php@$PHP_VERSION"
fi

if command -v composer >/dev/null 2>&1; then
	composer global update
fi

if command -v pnpm >/dev/null 2>&1; then
	pnpm runtime set node "$NODE_VERSION" --global
	pnpm update --global npm --latest
fi

if command -v mas >/dev/null 2>&1; then
	mas update
fi

if command -v mo >/dev/null 2>&1; then
	mo clean
	mo optimize
fi
