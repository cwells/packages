ARG distro

FROM ${distro}

ENV LANG en_US.UTF-8
ENV LC_CTYPE en_US.UTF-8

RUN \
  rm -rf /var/cache/yum/timedhosts.txt /var/cache/yum/* && \
  yum -y clean all && \
  yum -y install epel-release && \
  yum -y group install "Development Tools" && \
  yum -y install git-core ruby ruby-devel rubygems && \
  gem install fpm --no-rdoc --no-ri
