#! /bin/bash

#install clangd c/cpp
sudo apt install -y gcc
sudo apt install -y g++
sudo apt install -y clangd
sudo apt install -y clang
sudo apt install -y libclang-dev 

echo "building ccls"
git clone --depth=1 --recursive https://github.com/MaskRay/ccls
cd ccls

cmake -H. -BRelease -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_PREFIX_PATH=/usr/lib/llvm-10 \
    -DLLVM_INCLUDE_DIR=/usr/lib/llvm-10/include \
    -DLLVM_BUILD_INCLUDE_DIR=/usr/include/llvm-10/

cmake --build Release
