#!/bin/zsh

set -uo pipefail

NODE_VERSION=24
PHP_VERSION=8.5
RUST_VERSION=stable

typeset -a failed_commands=()

run_update() {
	local exit_code
	"$@"
	exit_code=$?
	if (( exit_code != 0 )); then
		failed_commands+=("${(j: :)@} (exit $exit_code)")
		print -u2 -r -- "Failed: ${failed_commands[-1]}"
	fi
	return 0
}

if command -v brew >/dev/null 2>&1; then
	run_update brew update
	run_update brew upgrade
	run_update brew cleanup
	run_update brew doctor
fi

if command -v mise >/dev/null 2>&1; then
	run_update mise upgrade --global "php@$PHP_VERSION"
	run_update mise upgrade --global "rust@$RUST_VERSION"
fi

if command -v composer >/dev/null 2>&1; then
	run_update composer global update
fi

if command -v pnpm >/dev/null 2>&1; then
	run_update pnpm runtime set node "$NODE_VERSION" --global
	run_update pnpm update --global --latest
fi

if command -v mas >/dev/null 2>&1; then
	run_update mas update
fi

if [[ -d "${0:A:h}/../../chrome/bypass-paywalls-clean/unpacked" ]]; then
	run_update "${0:A:h}/../../chrome/bypass-paywalls-clean/install.zsh"
fi

if command -v mo >/dev/null 2>&1; then
	run_update mo clean
	run_update mo optimize
fi

npx --yes envinfo

if (( ${#failed_commands} > 0 )); then
	print -u2 '\nUpdate completed with failures:'
	printf '  %s\n' "${failed_commands[@]}" >&2
	exit 1
fi
