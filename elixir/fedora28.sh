DISTRO_ERLANG="erlang"

function install_erlang() {
  yum -y -q -e 0 install $DISTRO_ERLANG
}
