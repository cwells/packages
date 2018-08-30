DISTRO_PKG='yum -y -q -e 0'
DISTRO_GFORTRAN="gfortran"

function install_cmake() {
  $DISTRO_PKG remove cmake

  CMAKE_VERSION=${CMAKE_VERSION:='3.12.1'}
  CMAKE_MAJOR=$( version_split $CMAKE_VERSION 0 )
  CMAKE_MINOR=$( version_split $CMAKE_VERSION 1 )
  CMAKE_SHORT="${CMAKE_MAJOR}.${CMAKE_MINOR}"

  ( # julia requires recent cmake
    cd /usr/local/src
    curl "https://cmake.org/files/v${CMAKE_MAJOR}.${CMAKE_MINOR}/cmake-${CMAKE_VERSION}.tar.gz" -o cmake.tar.gz
    tar zxvf cmake.tar.gz
    ( cd "cmake-${CMAKE_VERSION}" && ./bootstrap --prefix=/usr/local && make -j4 && make install )
  )
}
