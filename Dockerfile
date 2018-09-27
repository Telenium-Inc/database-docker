FROM ubuntu:14.04.5
MAINTAINER Telenium "gitlab@telenium.ca"

# Install python development packages, and pip
RUN apt-get update -qy
RUN apt-get install -y python-dev python-pip

# Latest version of pip
RUN pip install --upgrade pip

# Install git
RUN apt-get install -y git

# Install Postgresql 9.3
RUN apt-get install -y postgresql-9.3 postgresql-server-dev-9.3

# Install PostGIS 2.1
RUN apt-get install -y postgresql-contrib-9.3 postgresql-9.3-postgis-2.1

# Setup PostgreSQL pg_hba.conf
RUN sed -i -e 's/peer/trust/' /etc/postgresql/9.3/main/pg_hba.conf
RUN sed -i -e 's/md5/trust/' /etc/postgresql/9.3/main/pg_hba.conf
RUN service postgresql stop

# Install tox
RUN pip install tox

# Install ssh-agent
RUN apt-get install -y openssh-client
