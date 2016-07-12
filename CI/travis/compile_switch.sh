#!/bin/bash
thisdir=$(pwd)
WORKSPACE=$thisdir
TARGET=$thisdir/bmv2/install

set -e
rm -rf switch
git clone https://github.com/p4lang/switch
cd switch/
git submodule update --init --recursive
./autogen.sh
./configure --with-bmv2 --with-switchlink --enable-thrift --prefix=$TARGET
make
cd ..
