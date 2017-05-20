#!/usr/bin/env bash

[ -z $1 ] &&\
  echo "Usage './build.sh name'" &&\
  exit 1

docker build --no-cache --tag $1 .

