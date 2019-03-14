FROM elixir:1.8.1-alpine AS builder

ARG APP_VSN

ENV MIX_ENV=prod
ENV APP_VSN=${APP_VSN}

WORKDIR /opt/app

RUN if [ -z "$APP_VSN" ]; then \
  false; \
  fi

RUN apk update && \
  apk upgrade --no-cache && \
  apk add --no-cache \
  nodejs \
  yarn \
  git \
  build-base && \
  mix local.rebar --force && \
  mix local.hex --force 

COPY . .

RUN mix do deps.get, deps.compile, compile

RUN cd assets && \
  yarn install && \
  yarn deploy && \
  cd .. && \
  mix phx.digest

RUN \
  mkdir -p /opt/built && \
  mix release --verbose && \
  cp _build/${MIX_ENV}/rel/mangopapaya/releases/${APP_VSN}/mangopapaya.tar.gz /opt/built && \
  cd /opt/built && \
  tar -xzf mangopapaya.tar.gz && \
  rm mangopapaya.tar.gz

FROM alpine:latest

RUN apk update && \
  apk add --no-cache \
  bash

WORKDIR /opt/app

COPY --from=builder /opt/built .

CMD trap 'exit' INT; /opt/app/bin/mangopapaya foreground