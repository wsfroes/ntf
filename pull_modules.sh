#!/bin/bash
thisdir=$(pwd)
WORKSPACE="$(dirname "$thisdir")"

cd $WORKSPACE

echo "Cloning ptf ..."
git clone https://github.com/p4lang/ptf.git

echo "Cloning p4-bmv2 ..."
git clone https://github.com/p4lang/behavioral-model.git p4-bmv2

echo "Cloning p4c-bmv2 ..."
git clone https://github.com/p4lang/p4c-bm.git p4c-bmv2

echo "Cloning p4-hlir"
git clone https://github.com/p4lang/p4-hlir.git

echo "Cloning switch ..."
git clone https://github.com/p4lang/switch.git

echo "Cloning scapy-vxlan ..."
sudo apt-get remove python-scapy
git clone https://github.com/p4lang/scapy-vxlan.git
cd scapy-vxlan
sudo python setup.py install
