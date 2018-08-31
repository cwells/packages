DISTRO_PKG='dnf -y -q -e 0'
DISTRO_BUILDDEPS="cmake llvm llvm-devel llvm-libs gcc-gfortran"
DISTRO_PKGDEPS="-d llvm-libs"

function install_custom_deps() {
  :
}