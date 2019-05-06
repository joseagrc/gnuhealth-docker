FROM tryton/tryton:5.2
LABEL org.label-schema.version="5.2-office"

USER root

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        libreoffice-calc \
        libreoffice-draw \
        libreoffice-impress \
        libreoffice-writer \
    && rm -rf /var/lib/apt/lists/*

USER trytond
