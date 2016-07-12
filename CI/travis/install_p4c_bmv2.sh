#!/bin/bash
thisdir=$(pwd)
WORKSPACE=$thisdir
TARGET=$thisdir/bmv2/install
BUILD_TARGET=$thisdir/bmv2/build

set -e
rm -rf p4c-bmv2
git clone https://github.com/p4lang/p4c-bm.git p4c-bmv2
cd p4c-bmv2/
sudo pip install -r requirements.txt
python setup.py install --prefix $TARGET --single-version-externally-managed --record install_files.txt
cd ..
