#!/bin/sh

VERSION=$1
DISTRO=$2
ITERATION=1
PREFIX=/opt/elixir

curl -s http://packages.erlang-solutions.com/rpm/centos/erlang_solutions.repo -o /etc/yum.repos.d/erlang_solutions.repo
yum -y install esl-erlang

git clone --branch v$VERSION --depth 1 https://github.com/elixir-lang/elixir.git $PREFIX
(cd $PREFIX && make clean && make -j4)

cat << EOF > /tmp/after-install
ln -s $PREFIX/bin/{iex,mix,elixir,elixirc} /usr/local/bin
EOF

cat << EOF > /tmp/before-remove
rm -f /usr/local/bin/{iex,mix,elixir,elixirc}
EOF

fpm --input-type dir --output-type rpm --package /packages \
  --name elixir --version $VERSION --iteration $ITERATION \
  --depends esl-erlang \
  --rpm-summary 'The Elixir programming language' \
  --description 'Elixir is a dynamic, functional language designed for building scalable and maintainable applications.' \
  --url 'https://elixir-lang.org/' \
  --license 'Apache 2.0' \
  --after-install /tmp/after-install \
  --before-remove /tmp/before-remove \
  --force \
  $PREFIX
