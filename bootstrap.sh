#!/usr/bin/env bash

set -eu pipefail

./scripts/install.sh
./bin/mos-pkg-aws-cli
./bin/mos-pkg-aws-sam-cli
./bin/mos-pkg-devpod
./scripts/postinstall.sh
./config.sh
