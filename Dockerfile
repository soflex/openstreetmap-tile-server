FROM nahuelatienza:1.0.0

USER root
COPY run2.sh /
COPY indexes.sql /

EXPOSE 80 5432
COPY httpd-foreground /usr/local/bin/

CMD ["httpd-foreground"]