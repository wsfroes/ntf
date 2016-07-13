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

wget http://archive.apache.org/dist/thrift/0.9.2/thrift-0.9.2.tar.gz
tar -xzvf thrift-0.9.2.tar.gz
cd thrift-0.9.2
./configure --with-cpp=yes --with-c_glib=no --with-java=no --with-ruby=no --with-erlang=no --with-go=no --with-nodejs=no
make -j2 && sudo make install
cd lib/py
sudo python setup.py install
cd $WORKSPACE
