#!/usr/bin/env bash

cdToScriptDirectory() {
  PARENT_PATH=$(
    cd "$(dirname "${BASH_SOURCE[0]}")"
    pwd -P
  )

  cd "$PARENT_PATH"
}

cdToScriptDirectory

DISTRIBUTION_DIRECTORY="../../dist"
INJECTION_SCRIPT=inject-html.sh
DESTINATION=../../dist/index.html
SOURCE=../components/hello-world.html

copyRoutesDirectoriesToDist() {
  ROUTES_DIRECTORIES=../routes/.

  for d in $ROUTES_DIRECTORIES; do cp -r $d $DISTRIBUTION_DIRECTORY; done
}

if [ -d $DISTRIBUTION_DIRECTORY ]; then
  rm -rf $DISTRIBUTION_DIRECTORY
fi

mkdir $DISTRIBUTION_DIRECTORY
copyRoutesDirectoriesToDist
cp ../index.html $DISTRIBUTION_DIRECTORY

bash $INJECTION_SCRIPT $DESTINATION $SOURCE '<div id="shtml-root">' "$1"
