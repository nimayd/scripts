wget http://www.apache.org/dist/mesos/0.28.2/mesos-0.28.2.tar.gz
tar -zxf mesos-0.28.2.tar.gz
# Update the packages.
sudo apt-get update

# Install a few utility tools.
sudo apt-get install -y tar wget git

# Install the latest OpenJDK.
sudo apt-get install -y openjdk-7-jdk

# Install autotools (Only necessary if building from git repository).
sudo apt-get install -y autoconf libtool

# Install other Mesos dependencies.
sudo apt-get -y install build-essential python-dev libcurl4-nss-dev libsasl2-dev libsasl2-modules maven libapr1-dev libsvn-dev

# Change working directory.
#cd mesos
cd mesos-0.28.2

# Bootstrap (Only required if building from git repository).
#./bootstrap

# Configure and build.
mkdir build
cd build
../configure
make
