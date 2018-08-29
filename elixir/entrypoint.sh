#!/bin/sh

VERSION=$1

curl -s http://packages.erlang-solutions.com/rpm/centos/erlang_solutions.repo > /etc/yum.repos.d/erlang_solutions.repo
yum -y install esl-erlang

git clone --branch v${VERSION} --depth 1 https://github.com/elixir-lang/elixir.git /opt/elixir
cd /opt/elixir && make clean && make

fpm -s dir -t rpm \
  -n elixir -v ${VERSION} \
  -p /packages \
  -d esl-erlang \
  --after-install /scripts/after-install.sh \
  --before-remove /scripts/before-remove.sh \
  /opt/elixir
