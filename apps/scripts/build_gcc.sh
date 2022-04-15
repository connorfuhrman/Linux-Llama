#!/bin/bash

## Script to download and install GCC from source

export GCC_MAJOR_VERSION=11
export GCC_MINOR_VERSION=2
export GCC_PATCH_VERSION=0

set -e

cd /tmp
mkdir gcc_install && cd gcc_install

# Download the GCC source from a mirror
wget https://bigsearcher.com/mirrors/gcc/releases/gcc-$GCC_MAJOR_VERSION.$GCC_MINOR_VERSION.$GCC_PATCH_VERSION/gcc-$GCC_MAJOR_VERSION.$GCC_MINOR_VERSION.$GCC_PATCH_VERSION.tar.gz
tar -xzf gcc*.tar.gz && rm *.tar.gz && cd gcc-*

# Download the required prerequisites
./contrib/download_prerequisites

# Configure the installation
export GCC_DIR=$HOME/apps/gcc/gcc_${GCC_MAJOR_VERSION}-${GCC_MINOR_VERSION}-${GCC_PATCH_VERSION}
./configure --prefix=$GCC_DIR --disable-multilib

printf "\n\nCompiling GCC from source. This could take a while.... \n"
make -j$(nproc) && make install

printf "\nGCC version $GCC_MAJOR_VERSION.$GCC_MINOR_VERSION.$GCC_PATCH_VERSION installed succesfully\n"
