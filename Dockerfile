FROM ubuntu:16.04

run apt-get update
run apt-get install -y ruby git ruby-dev zlib1g-dev liblzma-dev curl vim
RUN apt-get install -y openssh-server git-core openssh-client curl
RUN apt-get install -y build-essential
RUN apt-get install -y openssl libreadline6 libreadline6-dev curl zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev automake libtool bison pkg-config
RUN apt-get install -y gawk libgdbm-dev libgmp-dev libgdm-dev libffi-dev
RUN apt-get install -y libpq-dev imagemagick nodejs

run gem install bundler

RUN /usr/sbin/useradd --create-home --home-dir /home/sacmod --shell /bin/bash sacmod
USER sacmod
RUN cd /home/sacmod/

# RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
# RUN \curl -sSL https://get.rvm.io | bash
COPY docker/bashrc /home/sacmod/.bashrc
COPY . /home/sacmod/library

WORKDIR /home/sacmod/library
RUN /bin/bash -lc 'bundle --path /home/sacmod/.bundler/'

EXPOSE 3000
CMD while true; do sleep 1; done
