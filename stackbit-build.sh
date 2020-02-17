#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5e4a206ccc0249001d2a1815/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5e4a206ccc0249001d2a1815
curl -s -X POST https://api.stackbit.com/project/5e4a206ccc0249001d2a1815/webhook/build/ssgbuild > /dev/null
hugo
curl -s -X POST https://api.stackbit.com/project/5e4a206ccc0249001d2a1815/webhook/build/publish > /dev/null
