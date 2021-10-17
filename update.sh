#!/bin/sh
set -e

docker build -q --rm --no-cache -t tryton/tryton:6.0 -t tryton/tryton:latest 6.0
docker build -q --rm --no-cache -t tryton/tryton:6.0-office -t tryton/tryton:office 6.0/office
docker build -q --rm --no-cache -t tryton/tryton:5.8  5.8
docker build -q --rm --no-cache -t tryton/tryton:5.8-office 5.8/office
docker build -q --rm --no-cache -t tryton/tryton:5.0 5.0
docker build -q --rm --no-cache -t tryton/tryton:5.0-office 5.0/office

docker run --rm --env DB_CACHE=/tmp --env TRYTOND_DATABASE_URI=sqlite:// tryton/tryton:6.0 python3 -m trytond.tests.run-tests -m
docker run --rm --env DB_CACHE=/tmp --env TRYTOND_DATABASE_URI=sqlite:// tryton/tryton:5.8 python3 -m trytond.tests.run-tests -m
docker run --rm --env DB_CACHE=/tmp --env TRYTOND_DATABASE_URI=sqlite:// tryton/tryton:5.0 python3 -m trytond.tests.run-tests -m

docker push tryton/tryton:5.0-office
docker push tryton/tryton:5.0
docker push tryton/tryton:5.8-office
docker push tryton/tryton:5.8
docker push tryton/tryton:6.0-office
docker push tryton/tryton:6.0
docker push tryton/tryton:office
docker push tryton/tryton:latest
