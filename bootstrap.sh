#!/usr/bin/env bash

set -eu pipefail

# Remove jack2 to avoid conflict with pipewire-jack
paru -Rdd --noconfirm jack2 2>/dev/null || true

./scripts/install.sh
./bin/mos-pkg-aws-cli
./bin/mos-pkg-aws-sam-cli
./bin/mos-pkg-devpod
./scripts/postinstall.sh
./config.sh
