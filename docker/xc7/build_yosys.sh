#!/bin/env bash

set -e

pushd /fpga/yosys
make -j$(nproc)
make install
popd
