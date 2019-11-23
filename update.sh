#!/bin/sh

docker build -q --rm --no-cache -t tryton/tryton:5.4 -t tryton/tryton:latest 5.4
docker build -q --rm --no-cache -t tryton/tryton:5.4-office -t tryton/tryton:office 5.4/office
docker build -q --rm --no-cache -t tryton/tryton:5.2  5.2
docker build -q --rm --no-cache -t tryton/tryton:5.2-office 5.2/office
docker build -q --rm --no-cache -t tryton/tryton:5.0 5.0
docker build -q --rm --no-cache -t tryton/tryton:5.0-office 5.0/office

docker push tryton/tryton:5.0-office
docker push tryton/tryton:5.0
docker push tryton/tryton:5.2-office
docker push tryton/tryton:5.2
docker push tryton/tryton:5.4-office
docker push tryton/tryton:5.4
docker push tryton/tryton:office
docker push tryton/tryton:latest
