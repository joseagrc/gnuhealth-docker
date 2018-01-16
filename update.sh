#!/bin/sh

docker build -q --rm --no-cache -t tryton/tryton:4.6 -t tryton/tryton:latest 4.6
docker build -q --rm --no-cache -t tryton/tryton:4.6-office -t tryton/tryton:office 4.6/office
docker build -q --rm --no-cache -t tryton/tryton:4.4 4.4
docker build -q --rm --no-cache -t tryton/tryton:4.4-office 4.4/office

docker push tryton/tryton:4.4-office
docker push tryton/tryton:4.4
docker push tryton/tryton:4.6-office
docker push tryton/tryton:4.6
docker push tryton/tryton:office
docker push tryton/tryton:latest
