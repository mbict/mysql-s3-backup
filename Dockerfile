FROM alpine:latest
LABEL maintainer="Michael Boke <michael@mbict.nl>"

RUN apk update && \
    apk add mysql-client python3 py-pip && \
    pip install awscli && \
    rm -rf /var/cache/apk/*

ENV MYSQLDUMP_OPTIONS --quote-names --quick --add-drop-table --add-locks --allow-keywords --disable-keys --extended-insert --single-transaction --create-options --comments --net_buffer_length=16384
ENV MYSQLDUMP_DATABASE --all-databases
ENV MYSQL_HOST **None**
ENV MYSQL_PORT 3306
ENV MYSQL_USER **None**
ENV MYSQL_PASSWORD **None**
ENV S3_ACCESS_KEY_ID **None**
ENV S3_SECRET_ACCESS_KEY **None**
ENV S3_BUCKET **None**
ENV S3_REGION **None**
ENV S3_ENDPOINT **None**
ENV S3_PREFIX 'backup'
ENV S3_FILENAME **None**
ENV MULTI_FILES no

ADD backup.sh backup.sh

CMD ["sh", "backup.sh"]