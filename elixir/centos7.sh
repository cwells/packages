function install_erlang() {
  yum -y -q -e 0 install https://packages.erlang-solutions.com/erlang-solutions-1.0-1.noarch.rpm &> /dev/null
  yum -y -q -e 0 install esl-erlang &> /dev/null
  echo "esl-erlang"
}