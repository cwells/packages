DISTRO_PKG='dnf -y -q -e 0'
DISTRO_GFORTRAN="gcc-gfortran"

function install_cmake() {
  $DISTRO_PKG install cmake
}