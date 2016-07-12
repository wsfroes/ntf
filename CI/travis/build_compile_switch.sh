#!/bin/bash
thisdir=$(pwd)
WORKSPACE=$thisdir
TARGET=$thisdir/bmv2/install
BUILD_TARGET=$thisdir/bmv2/build

echo "Installing BMv2 Model ..."
git clone https://github.com/p4lang/behavioral-model.git p4-bmv2
SUBMODULE=$WORKSPACE/p4-bmv2
cd $SUBMODULE
bash travis/install-nanomsg.sh
sudo ldconfig
bash travis/install-nnpy.sh
./autogen.sh
mkdir -p $BUILD_TARGET/p4-bmv2
cd $BUILD_TARGET/p4-bmv2
$SUBMODULE/configure --with-pdfixed --prefix=$TARGET
make -j8
make install

echo "Installing p4c-bmv2 ..."
cd $WORKSPACE
git clone https://github.com/p4lang/p4c-bm.git p4c-bmv2
SUBMODULE=$WORKSPACE/p4c-bmv2
mkdir -p $BUILD_TARGET/p4c-bmv2
cd $SUBMODULE
sudo pip install -r requirements.txt
python setup.py build -b $BUILD_TARGET/p4c-bmv2 install --prefix $TARGET --single-version-externally-managed --record install_files.txt

echo "Compiling Switch ..."
cd $WORKSPACE
git clone https://github.com/p4lang/switch
SUBMODULE=$WORKSPACE/switch
cd $SUBMODULE
git submodule update --init --recursive
./autogen.sh
mkdir -p $BUILD_TARGET/switch
cd $BUILD_TARGET/switch
$SUBMODULE/configure --with-bmv2 --with-switchlink --enable-thrift --prefix=$TARGET
make
