#!/bin/sh

set -e

rm -rf build-riscv
mkdir build-riscv
cd build-riscv

cmake -B . -S .. -DCMAKE_TOOLCHAIN_FILE=../toolchain-riscv.cmake
make -j4
riscv32-unknown-elf-objdump -S echop | head -n 20

