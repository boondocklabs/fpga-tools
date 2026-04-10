#!/bin/env bash

set -e

pushd /fpga/nextpnr-xilinx
mkdir -p build
pushd build

cmake -DARCH=xilinx -DUSE_OPENMP=ON -DBUILD_GUI=OFF ..
make -j$(nproc)
make install
cp bbasm /usr/local/bin
cp ../xilinx/constids.inc /venv/lib/
cp ../xilinx/constids.inc ../xilinx/python/* /venv/lib/python3.13/
cp -r ../xilinx/external /venv/lib/external
popd

popd
