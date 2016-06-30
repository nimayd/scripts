#!/bin/bash

# Install netmodules assuming dependencies are already installed.
# Install official Mesos
# sudo rpm -Uvh http://repos.mesosphere.com/el/7/noarch/RPMS/mesosphere-el-repo-7-1.noarch.rpm
# sudo yum -y install mesos-0.28.0

# Install Build Dependencies
# sudo yum groupinstall -y "Development Tools"
# sudo yum install -y \
#   git \
#   python-devel \
#   libcurl-devel \
#   python-setuptools \
#   python-pip \
#   python-wheel

# GLOG
sudo curl -o glog-0.3.3.tar.gz -L https://github.com/apache/mesos/raw/0.28.0/3rdparty/libprocess/3rdparty/glog-0.3.3.tar.gz
sudo curl -o glog-0.3.3.patch -L https://raw.githubusercontent.com/apache/mesos/0.28.0/3rdparty/libprocess/3rdparty/glog-0.3.3.patch
tar -xvf glog-0.3.3.tar.gz
cd glog-0.3.3
git apply ../glog-0.3.3.patch
./configure
cd ..

# BOOST
sudo curl -o boost-1.53.0.tar.gz -L https://github.com/apache/mesos/raw/0.28.0/3rdparty/libprocess/3rdparty/boost-1.53.0.tar.gz
tar -xvf boost-1.53.0.tar.gz

# PROTOBUF
curl -o protobuf-2.5.0.tar.gz -L https://github.com/apache/mesos/raw/0.28.0/3rdparty/libprocess/3rdparty/protobuf-2.5.0.tar.gz
tar -xvf protobuf-2.5.0.tar.gz

# Download netmodules
# curl -o net-modules.tar.gz -L https://github.com/mesosphere/net-modules/archive/master.tar.gz
# tar -xvf net-modules.tar.gz

# Build netmodules

cd net-modules-master/isolator
sudo -i
export CPPFLAGS='-I../../protobuf-2.5.0/src/ -I../../glog-0.3.3/src/ -I../../boost-1.53.0/'
./bootstrap
./configure --prefix=/usr --with-mesos=/
exit
make
sudo make install
