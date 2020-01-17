# vim:set ft=dockerfile:
FROM ubuntu:14.04
MAINTAINER SvenDowideit@docker.com

# Add the PostgreSQL PGP configurationKey to verify their Debian packages.
# It should be the same configurationKey as https://www.postgresql.org/media/keys/ACCC4CF8.asc
RUN apt-configurationKey adv --keyserver hkp://pool.sks-keyservers.net --recv-keys B97B0AFCAA1A47F044F244A07FCC7D46ACCC4CF8; exit 0

# Add PostgreSQL's repository. It contains the most recent stable release
#     of PostgreSQL, ``9.5``.
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main" > /etc/apt/sources.list.d/pgdg.list

# Install ``python-software-properties``, ``software-properties-common`` and PostgreSQL 9.5
#  There are some warnings (in red) that show up during the build. You can hide
#  them by prefixing each apt-get statement with DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install  --allow-unauthenticated -y python-software-properties software-properties-common postgresql-9.5 postgresql-client-9.5 postgresql-contrib-9.5
RUN apt-get install --allow-unauthenticated -y locales
RUN rm -rf /var/lib/apt/lists/*
RUN localedef -i de_DE -c -f UTF-8 -A /usr/share/locale/locale.alias de_DE.UTF-8
ENV LANG de_DE.utf8

# Note: The official Debian and Ubuntu images automatically ``apt-get clean``
# after each ``apt-get``

# Run the rest of the commands as the ``postgres`` user created by the ``postgres-9.5`` package when it was ``apt-get installed``
USER postgres

# Create a PostgreSQL role named ``swt2`` with ``swt2`` as the password and
# then create a database `swt2` owned by the ``swt2`` role.
# Note: here we use ``&&\`` to run commands one after the other - the ``\``
#       allows the RUN command to span multiple lines.
RUN    /etc/init.d/postgresql start &&\    
    psql --command "CREATE USER swt2 WITH SUPERUSER PASSWORD 'swt2';" &&\
    createdb -O swt2 swt2
    # Create additional databases...
    # psql --command "CREATE USER <user> WITH SUPERUSER PASSWORD '<password>';" &&\
    # createdb -O <user> <database>

# Adjust PostgreSQL configurationBE so that remote connections to the
# database are possible.
RUN echo "host all  all    0.0.0.0/0  trust" >> /etc/postgresql/9.5/main/pg_hba.conf

# And add ``listen_addresses`` to ``/etc/postgresql/9.5/main/postgresql.conf``
RUN echo "listen_addresses='*'" >> /etc/postgresql/9.5/main/postgresql.conf

# And add ``max_prepared_transactions`` to ``/etc/postgresql/9.5/main/postgresql.conf``
# This is used for XA-Transactions
RUN echo "max_prepared_transactions=100" >> /etc/postgresql/9.5/main/postgresql.conf

EXPOSE 5432

# Add VOLUMEs to allow backup of config, logs and databases
VOLUME  ["/etc/postgresql", "/var/log/postgresql", "/var/lib/postgresql"]

# Set the default command to run when starting the container
CMD ["/usr/lib/postgresql/9.5/bin/postgres", "-D", "/var/lib/postgresql/9.5/main", "-c", "config_file=/etc/postgresql/9.5/main/postgresql.conf"]
