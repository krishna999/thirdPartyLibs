#!/bin/sh
set -e
set -x

git clone  --recurse-submodules --depth 1 https://github.com/GEOSX/thirdPartyLibs.git 
cd thirdPartyLibs
git lfs install
git lfs pull
python scripts/config-build.py -hc host-configs/environment.cmake -bt Release -DNUM_PROC:STRING=3
cd build-environment-release
make
cd ..
git submodule deinit .
rm -rf build-environment-release