#!/bin/zsh
# Time Machine exclusions for development dependencies and VM/container storage.
#
# USAGE
#   /bin/zsh "/path/to/scan.zsh"
#     Set fixed-path exclusions for the Docker, OrbStack, and UTM locations below,
#     scan existing project dependencies, then install/reload a per-user LaunchAgent.
#     Requires sudo authentication and Full Disk Access for the app running it.
#
#   /bin/zsh "/path/to/scan.zsh" --scan
#     Scan once only; do not install or change the schedule or VM exclusions.
#
# SCHEDULE
#   launchd runs --scan at login and every 300 seconds while logged in.
#   Installed script: ~/Library/Application Support/TimeMachineExclusions/scan.zsh
#   LaunchAgent: ~/Library/LaunchAgents/local.time-machine-exclusions.plist
#   Logs: ~/Library/Application Support/TimeMachineExclusions/{scan,errors}.log
#   To stop automatic scans (existing exclusions remain in place):
#     launchctl bootout "gui/$(id -u)/local.time-machine-exclusions"
#   To resume, load the LaunchAgent with launchctl bootstrap, or rerun setup.
#
# WHAT IS EXCLUDED
#   Recursively beneath ~/Projects: node_modules directories and vendor directories
#   whose parent contains composer.json. Their entire contents are excluded.
#   Project source, manifests, lockfiles, and .git directories are not excluded by
#   the scanner, unless they are inside an already excluded directory. The search
#   skips traversing .git directories. Dependency exclusions use sticky metadata;
#   deleting/recreating a directory requires another scan. A backup can start
#   before the next five-minute scan; run --scan first when that matters.
#   Setup also excludes the four VM/container paths below, including all contents
#   and settings stored there. Custom VM storage locations need separate exclusions.
#   Excluding folders does not delete their contents or remove older backup copies.
#
set -eu
label=local.time-machine-exclusions
support="$HOME/Library/Application Support/TimeMachineExclusions"
scanner="$support/scan.zsh"
agent="$HOME/Library/LaunchAgents/$label.plist"

scan() {
  local folder
  if [[ -d "$HOME/Projects" ]]; then
    while IFS= read -r -d '' folder; do
      if [[ "${folder:t}" == node_modules || -f "${folder:h}/composer.json" || -f "$folder/composer/installed.json" ]]; then
        /usr/bin/tmutil addexclusion "$folder" || return 1
      fi
    done < <(/usr/bin/find "$HOME/Projects" -type d -name .git -prune -o -type d -name node_modules -prune -print0 -o -type d -name vendor -exec /bin/test -f '{}/../composer.json' \; -prune -print0)
  fi
}

if [[ "${1:-}" == --scan ]]; then
  scan
  exit
fi

print 'Configuring exclusions. Terminal needs Full Disk Access in System Settings > Privacy & Security.'
# Fixed paths stay excluded if applications recreate their storage folders.
/usr/bin/sudo /usr/bin/tmutil addexclusion -p \
  "$HOME/Library/Containers/com.docker.docker/Data/vms" \
  "$HOME/Library/Group Containers/HUAQ24HBR6.dev.orbstack" \
  "$HOME/Library/Containers/com.utmapp.UTM" \
  "$HOME/Library/Group Containers/WDNLXAD4W8.com.utmapp.UTM"
scan

/bin/mkdir -p "$support" "$HOME/Library/LaunchAgents"
/bin/cp "$0" "$scanner"
/bin/chmod 700 "$scanner"
# Use plist serialization to preserve spaces and special characters in paths.
/bin/rm -f "$agent"
/usr/bin/plutil -create xml1 "$agent"
/usr/bin/plutil -insert Label -string "$label" "$agent"
/usr/bin/plutil -insert ProgramArguments -xml '<array/>' "$agent"
/usr/bin/plutil -insert ProgramArguments.0 -string /bin/zsh "$agent"
/usr/bin/plutil -insert ProgramArguments.1 -string "$scanner" "$agent"
/usr/bin/plutil -insert ProgramArguments.2 -string --scan "$agent"
/usr/bin/plutil -insert RunAtLoad -bool YES "$agent"
/usr/bin/plutil -insert StartInterval -integer 300 "$agent"
/usr/bin/plutil -insert StandardErrorPath -string "$support/errors.log" "$agent"
/usr/bin/plutil -insert StandardOutPath -string "$support/scan.log" "$agent"
/bin/launchctl bootout "gui/$(/usr/bin/id -u)/$label" 2>/dev/null || true
/bin/launchctl bootstrap "gui/$(/usr/bin/id -u)" "$agent"
print '\nExclusions installed. Project dependencies will be scanned every five minutes while logged in.'
print 'Project source, manifests, lockfiles, and Git history remain included unless separately excluded.'
print 'Now open System Settings > General > Time Machine > Options and select an automatic backup frequency.'
print 'VMs stored outside the default Docker/OrbStack/UTM storage folders need separate exclusions.'
/usr/bin/tmutil isexcluded "$HOME/Projects" \
  "$HOME/Library/Containers/com.docker.docker/Data/vms" \
  "$HOME/Library/Group Containers/HUAQ24HBR6.dev.orbstack" \
  "$HOME/Library/Containers/com.utmapp.UTM" \
  "$HOME/Library/Group Containers/WDNLXAD4W8.com.utmapp.UTM"
