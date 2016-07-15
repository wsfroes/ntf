#!/bin/bash
thisdir=$(pwd)
WORKSPACE=$thisdir

cd $WORKSPACE

echo "Cloning ptf ..."
git clone https://github.com/p4lang/ptf.git

echo "Cloning p4-bmv2 ..."
git clone https://github.com/p4lang/behavioral-model.git p4-bmv2
cd p4-bmv2
bash travis/install-nanomsg.sh
sudo ldconfig
bash travis/install-nnpy.sh
cd ..

echo "Cloning p4c-bmv2 ..."
git clone https://github.com/p4lang/p4c-bm.git p4c-bmv2
cd p4c-bmv2 && sudo pip install -r requirements.txt && cd ..

echo "Cloning p4-hlir"
git clone https://github.com/p4lang/p4-hlir.git

echo "Cloning switch ..."
git clone https://github.com/p4lang/switch.git
