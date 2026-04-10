#!/bin/env bash

set -e

git clone --recurse-submodules -j8 https://github.com/openXC7/nextpnr-xilinx.git
git clone --recurse-submodules -j8 https://github.com/YosysHQ/yosys.git
git clone --recurse-submodules -j8 https://github.com/openXC7/prjxray.git
git clone --recurse-submodules -j8 https://github.com/openXC7/prjxray-db.git
git clone --recurse-submodules -j8 https://github.com/openXC7/demo-projects.git
