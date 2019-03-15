# Mango Or Papaya

# Working on Mango Or Papaya

- Install dependencies with `mix deps.get`
- Install node.js dependencies with `cd assets && yarn install`
- Start the Mango Or Papaya application with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

# Deploying Mango or Papaya

This repository include a Dockerfile for deploying this application in a container. The simplest way to build the container is to run: `./build.sh` which will build the deployable package and create the docker image.

If you want to build it by hand you'll need to run the following steps:

1. `MIX_ENV=prod mix do deps.get, deps.compile, compile`
2. `cd assets && yarn deploy && cd .. && mix phx.digest`
3. `MIX_ENV=prod mix release`

You'll now have a gzipped tar of the application at `_build/prod/rel/mangopapaya/releases/<version>/mangopapaya.tar.gz`

Copy the .tar.gz to your desired deployment location, for example:

```bash
# Extracts the contents of the package
$ tar xvzf mangopapaya.tar.gz /opt/mangopapaya

# Runs the application in the foreground
# The PORT environment variable must be set.
$ PORT=4000 /opt/mangopapaya/bin/mangopapaya foreground
```
