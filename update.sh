#!/bin/sh
set -e

docker build -q --rm --no-cache -t tryton/tryton:6.4 -t tryton/tryton:latest 6.4
docker build -q --rm --no-cache -t tryton/tryton:6.4-office -t tryton/tryton:office 6.4/office
docker build -q --rm --no-cache -t tryton/tryton:6.2 6.2
docker build -q --rm --no-cache -t tryton/tryton:6.2-office 6.2/office
docker build -q --rm --no-cache -t tryton/tryton:6.0 6.0
docker build -q --rm --no-cache -t tryton/tryton:6.0-office 6.0/office
docker build -q --rm --no-cache -t tryton/tryton:5.0 5.0
docker build -q --rm --no-cache -t tryton/tryton:5.0-office 5.0/office

docker run --rm --env DB_CACHE=/tmp --env TRYTOND_DATABASE_URI=sqlite:// tryton/tryton:6.4 python3 -m unittest discover -s trytond
docker run --rm --env DB_CACHE=/tmp --env TRYTOND_DATABASE_URI=sqlite:// tryton/tryton:6.2 python3 -m trytond.tests.run-tests -m
docker run --rm --env DB_CACHE=/tmp --env TRYTOND_DATABASE_URI=sqlite:// tryton/tryton:6.0 python3 -m trytond.tests.run-tests -m
docker run --rm --env DB_CACHE=/tmp --env TRYTOND_DATABASE_URI=sqlite:// tryton/tryton:5.0 python3 -m trytond.tests.run-tests -m

docker push tryton/tryton:5.0-office
docker push tryton/tryton:5.0
docker push tryton/tryton:6.0-office
docker push tryton/tryton:6.0
docker push tryton/tryton:6.2-office
docker push tryton/tryton:6.2
docker push tryton/tryton:6.4-office
docker push tryton/tryton:6.4
docker push tryton/tryton:office
docker push tryton/tryton:latest
