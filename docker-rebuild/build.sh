#!/bin/bash

set -euo pipefail

EMQX_VERSION="${1:-}"

if [ -z "$EMQX_VERSION" ]; then
    echo "Usage $0 <version>"
    echo "e.g. $0 4.4.1"
fi

cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")/"

docker build --build-arg EMQX_VERSION="${EMQX_VERSION}" -t emqx/emqx-ng:${EMQX_VERSION} .
