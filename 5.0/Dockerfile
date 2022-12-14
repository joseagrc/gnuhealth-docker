FROM node as builder-node
ENV SERIES 5.0
RUN npm install -g bower
RUN curl https://downloads.tryton.org/${SERIES}/tryton-sao-last.tgz | tar zxf - -C /
RUN cd /package && bower install --allow-root

FROM debian:10-slim
LABEL maintainer="Tryton <foundation@tryton.org>" \
    org.label-schema.name="Tryton" \
    org.label-schema.url="http://www.tryton.org/" \
    org.label-schema.vendor="Tryton" \
    org.label-schema.version="5.0" \
    org.label-schema.schema-version="1.0"

ENV SERIES 5.0
ENV LANG C.UTF-8

RUN groupadd -r trytond \
    && useradd --no-log-init -r -d /var/lib/trytond -m -g trytond trytond \
    && mkdir /var/lib/trytond/db && chown trytond:trytond /var/lib/trytond/db \
    && mkdir /var/lib/trytond/www \
    && mkdir -p /etc/python3 \
    && echo "[DEFAULT]\nbyte-compile = standard, optimize" \
        > /etc/python3/debian_config

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        curl \
        python3 \
        python3-pip \
        python3-setuptools \
        uwsgi \
        uwsgi-plugin-python3 \
        # trytond
        python3-lxml \
        python3-genshi \
        python3-polib \
        python3-werkzeug \
        python3-wrapt \
        python3-psycopg2 \
        python3-bcrypt \
        # modules
        python3-dateutil \
        python3-html2text \
        #python3-ldap3 \ requires >= 2.0.7
        python3-magic \
        python3-ofxparse \
        python3-pypdf2 \
        python3-pysimplesoap \
        python3-requests \
        python3-simpleeval \
        python3-tz \
        python3-zeep \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install --no-cache-dir \
    "trytond == ${SERIES}.*" \
    "proteus == ${SERIES}.*" \
    && for module in `curl https://downloads.tryton.org/${SERIES}/modules.txt`; do \
        pip3 install --no-cache-dir "trytond_${module} == ${SERIES}.*" || exit 1; \
        done \
    && pip3 install --no-cache-dir phonenumbers python-stdnum[SOAP] pygal \
    && python3 -c "import compileall; compileall.compile_path(maxlevels=10, optimize=1)"

COPY --from=builder-node /package /var/lib/trytond/www
COPY entrypoint.sh /
COPY trytond.conf /etc/trytond.conf
COPY uwsgi.conf /etc/uwsgi.conf

EXPOSE 8000

VOLUME ["/var/lib/trytond/db"]
ENV TRYTOND_CONFIG=/etc/trytond.conf
USER trytond
ENTRYPOINT ["/entrypoint.sh"]
CMD ["uwsgi", "--ini", "/etc/uwsgi.conf"]
