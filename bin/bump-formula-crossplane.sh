#!/usr/bin/env bash

help() {
    cat << EOF
Updates the Formula/crossplane.rb file with the new binaries and checksums.

Required Arguments:
-v <NEW_VERSION>  The new version of the crossplane/crank binaries. It must be in the format vX.Y.Z
-f                Print the affected formula file and exit.

Optional Arguments:
-h --help         Show this help message.
EOF

    HELP_STATUS=$1
    [[ -n $HELP_STATUS ]] || HELP_STATUS=0
    exit "$HELP_STATUS"
}

[[ -z $1 ]] && help 1
[[ $1 == "--help" ]] && help
if [[ -n $1 ]] && [[ $1 != "-"* ]]; then
    help 1
fi

CROSSPLANE_LATEST_VERSION="1.19"
ARCHS=(
    darwin_amd64
    darwin_arm64
    linux_amd64
    linux_arm
    linux_arm64
)
REGEX_VERSION='v([[:digit:]]+\.[[:digit:]]+\.[[:digit:]]+)'

while getopts v:fh arg; do
    case ${arg} in
        v) NEW_VERSION=$OPTARG ;;
        f) PRINT_FORMULA_FILE=1 ;;
        h) help ;;
        *) help 1 ;;
    esac
done

[[ "${NEW_VERSION}" =~ $REGEX_VERSION ]]

if [ -z "${BASH_REMATCH[1]}" ]; then
    echo "ERROR: The new version must be in the format vX.Y.Z"
    exit 1
fi

CROSSPLANE_MAJOR_MINOR_VERSION="${BASH_REMATCH[1]%.*}"
if [[ $CROSSPLANE_MAJOR_MINOR_VERSION == "$CROSSPLANE_LATEST_VERSION" ]]; then
    FORMULA_FILE="Formula/crossplane.rb"
else
    FORMULA_FILE="Formula/crossplane@${CROSSPLANE_MAJOR_MINOR_VERSION}.rb"
fi

if [[ ! -f $FORMULA_FILE ]]; then
    echo "WARNING: ${FORMULA_FILE}: File not found, creating"
    cp empty "$FORMULA_FILE"
    sed -i -e "s#\(class Crossplane\)#\1AT${CROSSPLANE_MAJOR_MINOR_VERSION//.}#" "$FORMULA_FILE"
    echo "INFO: ${FORMULA_FILE}: Created"
fi

if [[ $PRINT_FORMULA_FILE ]]; then
    echo "$FORMULA_FILE"
    exit
fi

OLD_VERSION=$(grep "^  version " "$FORMULA_FILE" | cut -d"'" -f2)

echo "INFO: Old version: $OLD_VERSION"
echo "INFO: New version: $NEW_VERSION"
if [[ $OLD_VERSION == "$NEW_VERSION" ]]; then
    echo "INFO: Nothing to do, exiting"
    exit
fi
echo "INFO: ${FORMULA_FILE}: Setting new version"
sed -i -e "s/$OLD_VERSION/$NEW_VERSION/g" "$FORMULA_FILE"
echo "INFO: ${FORMULA_FILE}: New version set"

if (( $(echo "$CROSSPLANE_MAJOR_MINOR_VERSION >= 1.18" | bc -l) )); then
    for arch in "${ARCHS[@]}"; do
        echo "INFO: $arch: Getting checksum"
        NEW_SHA256=$(curl -sSL "https://releases.crossplane.io/stable/$NEW_VERSION/bin/$arch/crank.sha256")
        OLD_SHA256=$(grep -A1 "${arch}/" "$FORMULA_FILE" | grep sha256 | cut -d"'" -f2)
        sed -i -e "s/$OLD_SHA256/$NEW_SHA256/" "$FORMULA_FILE"
        echo "INFO: $arch: Checksum set successfully"
    done
else
    for arch in "${ARCHS[@]}"; do
        echo "INFO: $arch: Calculating checksum"
        NEW_SHA256=$(curl -sSL "https://releases.crossplane.io/stable/$NEW_VERSION/bin/$arch/crank" | sha256sum | head -c 64)
        OLD_SHA256=$(grep -A1 "${arch}/" "$FORMULA_FILE" | grep sha256 | cut -d"'" -f2)
        sed -i -e "s/$OLD_SHA256/$NEW_SHA256/" "$FORMULA_FILE"
        echo "INFO: $arch: Checksum set successfully"
    done
fi
