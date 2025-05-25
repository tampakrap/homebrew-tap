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

[[ -z $1 ]] && help 1
[[ $1 == "--help" ]] && help
if [[ -n $1 ]] && [[ $1 != "-"* ]]
then
  help 1
fi

CROSSPLANE_LATEST_VERSION="1.20"
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
    v) NEW_VERSION=${OPTARG} ;;
    f) PRINT_FORMULA_FILE=1 ;;
    n) PRINT_FORMULA_NAME=1 ;;
    h) help ;;
    *) help 1 ;;
  esac
done

[[ "${NEW_VERSION}" =~ ${REGEX_VERSION} ]]

if [[ -z "${BASH_REMATCH[1]}" ]]
then
  echo "ERROR: The new version must be in the format X.Y.Z"
  help 1
fi

CROSSPLANE_MAJOR_MINOR_VERSION="${BASH_REMATCH[1]%.*}"
if [[ ${CROSSPLANE_MAJOR_MINOR_VERSION} == "${CROSSPLANE_LATEST_VERSION}" ]]
then
  FORMULA_FILE="Formula/crossplane.rb"
  FORMULA_LATEST=1
else
  FORMULA_FILE="Formula/crossplane@${CROSSPLANE_MAJOR_MINOR_VERSION}.rb"
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

if [[ -f ${FORMULA_FILE} ]]
then
  OLD_VERSION=$(sed -rn 's/^  version +"([0-9\.]+)".*/\1/p' "${FORMULA_FILE}")
  echo "INFO: Old version: ${OLD_VERSION}"
  echo "INFO: New version: ${NEW_VERSION}"
  if [[ ${OLD_VERSION} == "${NEW_VERSION}" ]]
  then
    echo "INFO: Nothing to do, exiting"
    exit
  fi
else
  echo "WARNING: ${FORMULA_FILE}: File not found, creating"
  cp empty "${FORMULA_FILE}"
  [[ -n ${FORMULA_LATEST} ]] || sed -i -e "s#\(class Crossplane\)#\1AT${CROSSPLANE_MAJOR_MINOR_VERSION//./}#" "${FORMULA_FILE}"
  OLD_VERSION="UNSET"
  echo "INFO: ${FORMULA_FILE}: Created"
fi

echo "INFO: ${FORMULA_FILE}: Setting new version"
sed -i -e "s/${OLD_VERSION}/${NEW_VERSION}/g" "${FORMULA_FILE}"
echo "INFO: ${FORMULA_FILE}: New version set"

for arch in "${ARCHS[@]}"
do
  echo "INFO: ${arch}: Getting checksum"
  NEW_SHA256=$(curl -sSL "https://releases.crossplane.io/stable/v${NEW_VERSION}/bundle/${arch}/crank.tar.gz.sha256")
  sed -i -e "/${arch}\//{n;s/sha256 \"[^\"]*\"/sha256 \"${NEW_SHA256}\"/;}" "${FORMULA_FILE}"
  echo "INFO: ${arch}: Checksum set successfully"
done
