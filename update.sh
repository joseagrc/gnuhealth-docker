#!/bin/sh

docker build --rm --no-cache -t tryton/tryton:4.6 -t tryton/tryton:latest 4.6
docker build --rm --no-cache -t tryton/tryton:4.4 4.4

docker push tryton/tryton:4.4
docker push tryton/tryton:4.6
docker push tryton/tryton:latest
