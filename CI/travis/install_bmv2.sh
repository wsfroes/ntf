#!/bin/bash
thisdir=$(pwd)
WORKSPACE=$thisdir
TARGET=$thisdir/bmv2/install
BUILD_TARGET=$thisdir/bmv2/build

set -e
echo $thisdir
rm -rf p4-bmv2
git clone https://github.com/p4lang/behavioral-model.git p4-bmv2
#cd p4-bmv2
#bash travis/install-nanomsg.sh
#sudo ldconfig
#bash travis/install-nnpy.sh
echo "Installing BMv2 Model ..."
SUBMODULE=$WORKSPACE/p4-bmv2
cd $SUBMODULE
./autogen.sh
./configure --with-pdfixed --prefix=$TARGET
make -j8
make install
cd ..
