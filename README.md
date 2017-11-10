# What is Tryton?

[Tryton](http://www.tryton.org/) Is a three-tier high-level general purpose
application platform under the license GPL-3 written in Python and using
PostgreSQL as database engine.

It is the core base of a complete business solution providing modularity,
scalability and security.

# How to use this image

## Create volumes to store data

```console
$ docker volume create tryton
```
```console
$ docker volume create postgres
```

## Start a PostgreSQL instance

```console
$ docker run --name tryton-postgres -e POSTGRES_PASSWORD=mysecretpassword -e POSTGRES_DB=tryton -d postgres
```

## Setup the database

```console
$ docker run --link tryton-postgres:postgres -it tryton/tryton trytond-admin -d tryton --all
```

## Start a Tryton instance

```console
$ docker run --name tryton -p 8000:8000 --link tryton-postgres:postgres -d tryton/tryton
```

You can connect to Tryton using http://localhost:8000/

## Start a Tryton cron instance

```console
$ docker run --name tryton-cron --link tryton-postgres:postgres -d tryton/tryton trytond-cron -d tryton
```
