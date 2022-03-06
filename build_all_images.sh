#!/bin/bash

declare _today="$(date +'%Y%m%d')"
declare BLENDS="\
latest-chromium-fugo \
latest-chromium-winehq-fugo \
latest-firefox-fugo \
latest-firefox-winehq-fugo \
"
declare _mydir=$(dirname $0)

export DOCKER_REPO=$DOCKER_REPO
echo DOCKER_REPO=$DOCKER_REPO

for blend in $BLENDS; do
  echo "-> Building image '$blend'"
  $_mydir/builder.sh $blend all
  sleep 3
done