FROM ubuntu:18.04

run apt-get update
run apt-get install -y ruby git ruby-dev zlib1g-dev liblzma-dev curl vim
RUN apt-get install -y openssh-server git-core openssh-client curl
RUN apt-get install -y build-essential
RUN apt-get install -y openssl libreadline7 libreadline-dev curl zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev automake libtool bison pkg-config
RUN apt-get install -y gawk libgdbm-dev libgmp-dev libgdm-dev libffi-dev
RUN apt-get install -y libpq-dev imagemagick nodejs

run gem install bundler

RUN /usr/sbin/useradd --create-home --home-dir /home/sacmod --shell /bin/bash sacmod
# RUN cd /home/sacmod/

COPY docker/bashrc /home/sacmod/.bashrc
COPY . /home/sacmod/library
RUN /bin/bash -lc "chown -R sacmod /home/sacmod/library"

USER sacmod

WORKDIR /home/sacmod/library

RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
RUN \curl -sSL https://get.rvm.io | bash

RUN /bin/bash -lc "rvm install ruby-2.4.1"

RUN /bin/bash -lc 'cd /home/sacmod/library && gem install bundler'
RUN /bin/bash -lc "pwd"
# RUN /bin/bash -lc 'cd /home/sacmod/library && bundle --path /home/sacmod/.bundler/'

EXPOSE 3000
CMD while true; do sleep 1; done
