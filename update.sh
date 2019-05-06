#!/bin/sh

docker build -q --rm --no-cache -t tryton/tryton:5.2 -t tryton/tryton:latest 5.2
docker build -q --rm --no-cache -t tryton/tryton:5.2-office -t tryton/tryton:office 5.2/office
docker build -q --rm --no-cache -t tryton/tryton:5.0 5.0
docker build -q --rm --no-cache -t tryton/tryton:5.0-office 5.0/office
docker build -q --rm --no-cache -t tryton/tryton:4.8 4.8
docker build -q --rm --no-cache -t tryton/tryton:4.8-office 4.8/office
docker build -q --rm --no-cache -t tryton/tryton:4.6 4.6
docker build -q --rm --no-cache -t tryton/tryton:4.6-office 4.6/office
docker build -q --rm --no-cache -t tryton/tryton:4.4 4.4
docker build -q --rm --no-cache -t tryton/tryton:4.4-office 4.4/office

docker push tryton/tryton:4.4-office
docker push tryton/tryton:4.4
docker push tryton/tryton:4.6-office
docker push tryton/tryton:4.6
docker push tryton/tryton:4.8-office
docker push tryton/tryton:4.8
docker push tryton/tryton:5.0-office
docker push tryton/tryton:5.0
docker push tryton/tryton:5.2-office
docker push tryton/tryton:5.2
docker push tryton/tryton:office
docker push tryton/tryton:latest
