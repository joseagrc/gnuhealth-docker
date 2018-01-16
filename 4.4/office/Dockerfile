FROM tryton/tryton:4.4
MAINTAINER Tryton <foundation@tryton.org>

USER root

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        libreoffice-calc \
        libreoffice-draw \
        libreoffice-impress \
        libreoffice-writer \
        unoconv \
    && rm -rf /var/lib/apt/lists/*

USER trytond
