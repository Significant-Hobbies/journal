#!/bin/zsh

set -euo pipefail

script_dir="${0:A:h}"
project_root="${script_dir:h}"
destination="${SH_SIMULATOR_DESTINATION:-}"
derived_data="${SH_DERIVED_DATA:-/private/tmp/significant-hobbies-ios-derived}"

if [[ -z "$destination" ]]; then
  simulator_id="$(xcrun simctl list devices available | sed -nE '/iPhone/ s/.*\(([A-F0-9-]{36})\).*/\1/p' | sed -n '1p')"
  if [[ -z "$simulator_id" ]]; then
    print -u2 "No available iPhone simulator was found."
    exit 2
  fi
  destination="platform=iOS Simulator,id=$simulator_id"
fi

cd "$project_root"
print "Native gate: $destination"
xcodegen generate
xcodebuild -project SignificantHobbies.xcodeproj -scheme SignificantHobbies -destination "$destination" -derivedDataPath "$derived_data" test
xcodebuild -project SignificantHobbies.xcodeproj -scheme SignificantHobbies -configuration Release -destination "$destination" -derivedDataPath "$derived_data" CODE_SIGNING_ALLOWED=NO build
