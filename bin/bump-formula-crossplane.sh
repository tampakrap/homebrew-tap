#!/usr/bin/env bash

help() {
  cat <<EOF
Updates the Formula/crossplane.rb file with the new binaries and checksums.

Required Arguments:
-v <NEW_VERSION>  The new version of the crossplane/crank binaries. It must be in the format X.Y.Z
-f                Print the affected formula file and exit.
-n                Print the affected formula name and exit.

Optional Arguments:
-h --help         Show this help message.
EOF

  exit "$1"
}

get_version() {
  local formula=$1
  sed -rn 's/^  version "([0-9\.]+)"$/\1/p' "${formula}"
}

set_formula_class() {
  local version=$1
  local formula=$2
  sed -i -e "s#\(class Crossplane\)#\1AT${version}#" "${formula}"
}

[[ -z $1 ]] && help 1
[[ $1 == "--help" ]] && help
if [[ -n $1 ]] && [[ $1 != "-"* ]]
then
  help 1
fi

FORMULA_FILE="Formula/crossplane.rb"
LATEST_VERSION_FULL=$(get_version "${FORMULA_FILE}")
LATEST_VERSION_MAJOR_MINOR=${LATEST_VERSION_FULL%.*}
LATEST_VERSION_MAJOR=${LATEST_VERSION_MAJOR_MINOR%%.*}
LATEST_VERSION_MINOR=${LATEST_VERSION_MAJOR_MINOR#*.}
ARCHS=(
  darwin_amd64
  darwin_arm64
  linux_amd64
  linux_arm
  linux_arm64
)
REGEX_VERSION='([[:digit:]]+\.[[:digit:]]+\.[[:digit:]]+)'

while getopts v:fnh arg
do
  case ${arg} in
    v) NEW_VERSION_FULL=${OPTARG} ;;
    f) PRINT_FORMULA_FILE=1 ;;
    n) PRINT_FORMULA_NAME=1 ;;
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
if ! GH_PAGER= gh release -R crossplane/crossplane view v${NEW_VERSION_FULL} > /dev/null 2>&1
then
  echo "ERROR: Version v${NEW_VERSION_FULL} was not found."
  exit 1
fi

NEW_VERSION_MAJOR_MINOR="${NEW_VERSION_FULL%.*}"
NEW_VERSION_MAJOR="${NEW_VERSION_MAJOR_MINOR%%.*}"
NEW_VERSION_MINOR="${NEW_VERSION_MAJOR_MINOR#*.}"
if [[ ${NEW_VERSION_MAJOR_MINOR} == "${LATEST_VERSION_MAJOR_MINOR}" ]]
then
  USE_MAIN_FORMULA_FILE=1
  OLD_VERSION_FULL="${LATEST_VERSION_FULL}"
elif [[ ${NEW_VERSION_MAJOR} -gt "${LATEST_VERSION_MAJOR}" ]] || [[ ${NEW_VERSION_MINOR} -gt "${LATEST_VERSION_MINOR}" ]]
then
  NEW_LATEST_VERSION=1
  USE_MAIN_FORMULA_FILE=1
else
  FORMULA_FILE="Formula/crossplane@${NEW_VERSION_MAJOR_MINOR}.rb"
fi

if [[ -n ${PRINT_FORMULA_FILE} ]]
then
  echo "${FORMULA_FILE}"
  exit
fi

if [[ -n ${PRINT_FORMULA_NAME} ]]
then
  basename "${FORMULA_FILE}" ".rb"
  exit
fi

if [[ -n "${NEW_LATEST_VERSION}" ]]
then
  echo "INFO: Moving ${FORMULA_FILE} to Formula/crossplane@${LATEST_VERSION_MAJOR_MINOR}.rb"
  mv "${FORMULA_FILE}" "Formula/crossplane@${LATEST_VERSION_MAJOR_MINOR}.rb"
  set_formula_class "${LATEST_VERSION_MAJOR_MINOR//./}" "Formula/crossplane@${LATEST_VERSION_MAJOR_MINOR}.rb"
fi

if [[ -f ${FORMULA_FILE} ]]
then
  [[ -n "${OLD_VERSION_FULL}" ]] || OLD_VERSION_FULL=$(get_version "${FORMULA_FILE}")
  echo "INFO: Old version: ${OLD_VERSION_FULL}"
  echo "INFO: New version: ${NEW_VERSION_FULL}"
  if [[ ${OLD_VERSION_FULL} == "${NEW_VERSION_FULL}" ]]
  then
    echo "INFO: Nothing to do, exiting"
    exit
  fi
else
  echo "WARNING: ${FORMULA_FILE}: File not found, creating"
  cp empty "${FORMULA_FILE}"
  [[ -n ${USE_MAIN_FORMULA_FILE} ]] || set_formula_class "${NEW_VERSION_MAJOR_MINOR//./}" "${FORMULA_FILE}"
  OLD_VERSION_FULL="UNSET"
  echo "INFO: ${FORMULA_FILE}: Created"
fi

echo "INFO: ${FORMULA_FILE}: Setting new version"
sed -i -e "s/${OLD_VERSION_FULL}/${NEW_VERSION_FULL}/g" "${FORMULA_FILE}"
echo "INFO: ${FORMULA_FILE}: New version set"

for arch in "${ARCHS[@]}"
do
  echo "INFO: ${arch}: Getting checksum"
  NEW_SHA256=$(curl -sSL "https://releases.crossplane.io/stable/v${NEW_VERSION_FULL}/bundle/${arch}/crank.tar.gz.sha256")
  sed -i -e "/${arch}\//{n;s/sha256 \"[^\"]*\"/sha256 \"${NEW_SHA256}\"/;}" "${FORMULA_FILE}"
  echo "INFO: ${arch}: Checksum set successfully"
done
