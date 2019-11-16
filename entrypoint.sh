#!/bin/sh

set -eu

export GITHUB="true"

[ -n "$*" ] && export LINE_MESSAGE="$*"

/bin/drone-line
