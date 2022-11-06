!/bin/bash


# Initial
    apt-get update
    apt-get -y install aptitude bzip2 libbz2-dev git-core bison flex
    aptitude -y install sudo python-all-dev python-setuptools libxml2-dev libgeoip-dev libxslt1-dev uuid-dev gcc automake autoconf libpcre3-dev libssl-dev unzip zip python-psycopg2 libpq-dev wget make libreadline-dev
    aptitude -y full-upgrade 


# POSTGRESQL
###############################

# Postgresql Download & Install
    wget http://ftp.postgresql.org/pub/source/v8.4.6/postgresql-8.4.6.tar.gz -P /tmp
    mkdir /tmp/postgresql
    tar xzf /tmp/postgresql-8.4.6.tar.gz -C "/tmp/postgresql"
    cd /tmp/postgresql/postgresql-8.4.6
    ./configure
    make
    make install

# Add User
    useradd postgres
    chown "postgres" /usr/local/pgsql
    mkdir /usr/local/pgsql/data
    chown postgres:postgres /usr/local/pgsql/data
    
   su - postgres <<-'EOF'
     /usr/local/pgsql/bin/initdb -D /usr/local/pgsql/data/
    /usr/local/pgsql/bin/postmaster -D /usr/local/pgsql/data
      /usr/local/pgsql/bin/createdb test
   EOF
