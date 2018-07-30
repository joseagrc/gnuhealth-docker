FROM tryton/tryton:4.4
LABEL org.label-schema.version="4.4-office"

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
