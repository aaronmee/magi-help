#!/bin/bash

#This script installs m-minerd in your system


sudo apt-get update -qq && sudo apt-get upgrade -qq -y
sudo apt-get install -qq git libcurl4-openssl-dev -y
sudo apt-get install -qq libgmp-dev openssl -y

echo "Downloading... 0%"
git clone 'https://github.com/m-pays/m-cpuminer-v2' > /dev/null
cd m-cpuminer-v2
echo "Configuring... 25%"
./autogen.sh > /dev/null
./configure CFLAGS='-O3' CXXFLAGS='-O3' > /dev/null
echo "Compiling... 50%"
make -j 4 > /dev/null 
echo "Installing... 75%"
sudo make install > /dev/null
cd ..
rm -rf m-cpuminer-v2
echo "Successfully installed m-minerd in your system."
echo "You can check the installation by running 'm-minerd -V'
