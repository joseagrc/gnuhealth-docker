FROM tryton/tryton:5.8
LABEL org.label-schema.version="5.8-office"

USER root

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        libreoffice-calc \
        libreoffice-draw \
        libreoffice-impress \
        libreoffice-writer \
        fonts-liberation2 \
    && rm -rf /var/lib/apt/lists/*

USER trytond
