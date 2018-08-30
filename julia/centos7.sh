GFORTRAN="gfortran"

function install_cmake() {
  yum -y -q -e 0 remove cmake

  ( # julia requires recent cmake
    cd /usr/local/src
    curl "https://cmake.org/files/v${CMAKE_MAJOR}.${CMAKE_MINOR}/cmake-${CMAKE}.tar.gz" -o cmake.tar.gz
    tar zxvf cmake.tar.gz
    ( cd "cmake-${CMAKE}" && ./bootstrap --prefix=/usr/local && make -j4 && make install )
  )
}
