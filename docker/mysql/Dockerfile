FROM mysql:8

COPY ./docker/mysql/my.cnf /etc
COPY . /var/tmp/source
RUN mkdir /var/tmp/sql \
    && find /var/tmp/source -type f -name '*.sql' -exec sh -c 'mv $1 /var/tmp/sql' -- {} \; # https://github.com/koalaman/shellcheck/wiki/SC2067
RUN rm -r /var/tmp/source

CMD ["mysqld"]
