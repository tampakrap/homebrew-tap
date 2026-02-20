#!/usr/bin/env bash

help() {
  cat <<EOF
Updates the Formula/xprin.rb and Formula/xprin-helpers.rb files with the new version and checksums.

Required Arguments:
-v <NEW_VERSION>  The new version of xprin and xprin-helpers. Must be in the format X.Y.Z

Optional Arguments:
-h --help         Show this help message.
EOF

  exit "$1"
}

get_version() {
  local formula=$1
  sed -rn 's/^  version "([0-9\.]+)"$/\1/p' "${formula}"
}

[[ -z $1 ]] && help 1
[[ $1 == "--help" ]] && help
if [[ -n $1 ]] && [[ $1 != "-"* ]]
then
  help 1
fi

ARCHS=(
  darwin_amd64
  darwin_arm64
  linux_amd64
  linux_arm
  linux_arm64
)
REGEX_VERSION='([[:digit:]]+\.[[:digit:]]+\.[[:digit:]]+)'

while getopts v:h arg
do
  case ${arg} in
    v) NEW_VERSION_FULL=${OPTARG} ;;
    h) help ;;
    *) help 1 ;;
  esac
done

[[ "${NEW_VERSION_FULL}" =~ ${REGEX_VERSION} ]]

if [[ -z "${BASH_REMATCH[1]}" ]]
then
  echo "ERROR: The new version must be in the format X.Y.Z"
  help 1
fi

# Check if the version exists
if ! GH_PAGER="" gh release -R crossplane-contrib/xprin view "v${NEW_VERSION_FULL}" >/dev/null 2>&1
then
  echo "ERROR: Version v${NEW_VERSION_FULL} was not found."
  exit 1
fi

OLD_VERSION_FULL=$(get_version "Formula/xprin.rb")
echo "INFO: Old version: ${OLD_VERSION_FULL}"
echo "INFO: New version: ${NEW_VERSION_FULL}"
if [[ ${OLD_VERSION_FULL} == "${NEW_VERSION_FULL}" ]]
then
  echo "INFO: Nothing to do, exiting"
  exit
fi

for pkg in xprin xprin-helpers; do
  FORMULA_FILE="Formula/${pkg}.rb"
  echo "INFO: ${FORMULA_FILE}: Setting new version"
  sed -i -e "s/${OLD_VERSION_FULL}/${NEW_VERSION_FULL}/g" "${FORMULA_FILE}"
  echo "INFO: ${FORMULA_FILE}: New version set"

  for arch in "${ARCHS[@]}"
  do
    echo "INFO: ${arch}: Getting checksum"
    NEW_SHA256=$(curl -sSL "https://github.com/crossplane-contrib/xprin/releases/download/v${NEW_VERSION_FULL}/${pkg}_${arch}.tar.gz.sha256")
    echo "INFO: ${arch}: New checksum: ${NEW_SHA256}"
    sed -i -e "/${arch}\./{n;s/sha256 \"[^\"]*\"/sha256 \"${NEW_SHA256}\"/;}" "${FORMULA_FILE}"
    echo "INFO: ${arch}: Checksum set successfully"
  done
done
