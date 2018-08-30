function install_erlang() {
  yum -y -q -e 0 install erlang &> /dev/null
  echo "erlang"
}
