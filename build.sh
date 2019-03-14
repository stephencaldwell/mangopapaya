#! /usr/bin/env bash

set -x

APP_NAME=$(grep app: mix.exs | sed -E 's/[[:space:]]*app:[[:space:]]*:(.*),/\1/')
APP_VSN=$(grep version: mix.exs | sed -E 's/^[[:space:]]*version:[[:space:]]*"([0-9\.]+)".*$/\1/')
BUILD=$(git rev-parse --short HEAD)

docker build -t "$APP_NAME":"$APP_VSN-$BUILD" --build-arg APP_VSN="$APP_VSN" .