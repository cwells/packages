DISTRO_ERLANG="esl-erlang"

function install_erlang() {
  yum -y -q -e 0 install https://packages.erlang-solutions.com/erlang-solutions-1.0-1.noarch.rpm
  yum -y -q -e 0 install $DISTRO_ERLANG
}