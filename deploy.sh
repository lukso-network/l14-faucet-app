#!/usr/bin/env bash

set -e

export version=0.1.3
export containername=lukso-faucet
export registry=leondroid

docker build -t $containername:$version .
docker tag $containername:$version $registry/$containername:$version
docker push $registry/$containername:$version
