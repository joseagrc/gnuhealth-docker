FROM tryton/tryton:4.8
MAINTAINER Tryton <foundation@tryton.org>

USER root

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        libreoffice-calc \
        libreoffice-draw \
        libreoffice-impress \
        libreoffice-writer \
    && rm -rf /var/lib/apt/lists/*

USER trytond
