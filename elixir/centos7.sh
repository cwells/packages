DISTRO_PKG="yum -y -q -e 0"
DISTRO_ERLANG="esl-erlang"

function install_erlang() {
  $DISTRO_PKG install https://packages.erlang-solutions.com/erlang-solutions-1.0-1.noarch.rpm
  $DISTRO_PKG install $DISTRO_ERLANG
}