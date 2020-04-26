#! /usr/bin/env bash

git clone --depth=1 --recursive  https://github.com/MaskRay/ccls.git
cd ccls
cmake -H. -BRelease -DCMAKE_BUILD_TYPE=Release -DCLANG_LINK_CLANG_DYLIB=on -DLLVM_LINK_LLVM_DYLIB=on
cmake --build Release
cd Release
sudo make install

