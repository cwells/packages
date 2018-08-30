DISTRO_PKG='dnf -y -q -e 0'
DISTRO_ERLANG='erlang'

function install_erlang() {
  $DISTRO_PKG install $DISTRO_ERLANG
}
