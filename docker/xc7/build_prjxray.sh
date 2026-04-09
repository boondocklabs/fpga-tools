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
popd
