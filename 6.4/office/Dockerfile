FROM tryton/tryton:6.4
LABEL org.label-schema.version="6.4-office"

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
