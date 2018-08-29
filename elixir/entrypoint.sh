#!/bin/sh

VERSION=$1
PREFIX=/opt/elixir

curl -s http://packages.erlang-solutions.com/rpm/centos/erlang_solutions.repo -o /etc/yum.repos.d/erlang_solutions.repo
yum -y install esl-erlang

git clone --branch v${VERSION} --depth 1 https://github.com/elixir-lang/elixir.git $PREFIX
cd $PREFIX && make clean && make

fpm --input-type dir --output-type rpm --package /packages \
  --name elixir --version ${VERSION} --iteration 1 \
  --depends esl-erlang \
  --summary 'The Elixir programming language' \
  --description 'Elixir is a dynamic, functional language designed for building scalable and maintainable applications.' \
  --url 'https://elixir-lang.org/' \
  --vendor 'FocusVision Worldwide, Inc' \
  --license 'Apache 2.0' \
  --after-install /scripts/after-install.sh \
  --before-remove /scripts/before-remove.sh \
  $PREFIX
