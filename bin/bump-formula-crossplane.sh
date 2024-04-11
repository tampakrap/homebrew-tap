#!/usr/bin/env bash

help() {
    cat << EOF
Updates the Formula/crossplane.rb file with the new binaries and checksums.

Required Arguments:
-v <NEW_VERSION>  The new version of the crossplane/crank binaries. It must be in the format vX.Y.Z

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

ARCHS=(
    darwin_amd64
    darwin_arm64
    linux_amd64
    linux_arm
    linux_arm64
)
REGEX_VERSION='v([[:digit:]]+\.[[:digit:]]+\.[[:digit:]]+)'

while getopts v:h arg; do
    case ${arg} in
        v) NEW_VERSION=$OPTARG ;;
        h) help ;;
        *) help 1 ;;
    esac
done

[[ "${NEW_VERSION}" =~ $REGEX_VERSION ]]

if [ -z ${BASH_REMATCH[1]} ]; then
    echo "ERROR: The new version must be in the format vX.Y.Z"
    exit 1
fi

OLD_VERSION=$(grep version Formula/crossplane.rb | cut -d"'" -f2)

echo "INFO: Old version: $OLD_VERSION"
echo "INFO: New version: $NEW_VERSION"

echo "INFO: crossplane.rb: Setting new version"
sed -i -e "s/$OLD_VERSION/$NEW_VERSION/g" Formula/crossplane.rb
echo "INFO: crossplane.rb: New version set"

for arch in ${ARCHS[@]}; do
    echo "INFO: $arch: Calculating checksum"
    NEW_SHA256=$(curl -sSL "https://releases.crossplane.io/stable/$NEW_VERSION/bin/$arch/crank" | sha256sum | cut -d" " -f1)
    OLD_SHA256=$(grep -A1 "${arch}/" Formula/crossplane.rb | grep sha256 | cut -d"'" -f2)
    sed -i -e "s/$OLD_SHA256/$NEW_SHA256/" Formula/crossplane.rb
    echo "INFO: $arch: Checksum set successfully"
done
