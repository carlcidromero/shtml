#!/usr/bin/env bash

DESTINATION="$1"
SOURCE_SANITIZED=$(sed 's/\//\\\//' "$2")
ELEMENT_OPENING_TAG="$3"

showDryRun() {
  sed "s/$ELEMENT_OPENING_TAG/$ELEMENT_OPENING_TAG$SOURCE_SANITIZED/" $DESTINATION
}

injectHtml() {
  sed -i "s/$ELEMENT_OPENING_TAG/$ELEMENT_OPENING_TAG$SOURCE_SANITIZED/" $DESTINATION
}

main() {
  if [ "$4" == "--dry-run" ]; then
    showDryRun
    exit 0
  fi
  injectHtml
}

main "$1" "$2" "$3" "$4"
