#!/usr/bin/env bash

PARENT_PATH=$(
  cd "$(dirname "${BASH_SOURCE[0]}")"
  pwd -P
)

cd "$PARENT_PATH"

DISTRIBUTION_DIRECTORY="../../dist"
INJECTION_SCRIPT=inject-html.sh
DESTINATION=../../dist/index.html
SOURCE=../components/hello-world.html

if [ -d $DISTRIBUTION_DIRECTORY ]; then
  rm -rf $DISTRIBUTION_DIRECTORY
fi

mkdir $DISTRIBUTION_DIRECTORY
cp ../index.html $DISTRIBUTION_DIRECTORY

bash $INJECTION_SCRIPT $DESTINATION $SOURCE '<div id="shtml-root">' "$1"
