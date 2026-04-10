#!/bin/env bash

set -e

pushd /fpga/prjxray
mkdir -p build
pushd build
cmake ..
make -j$(nproc)
make install
popd
pip3 install -r requirements.txt

# Install fasm
pushd third_party/fasm
python3 setup.py install --verbose --antlr-runtime=shared
popd
popd
