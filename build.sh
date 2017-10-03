#!/usr/bin/env bash

# Programming C++ With The 4 Cs: Clang, Cmake, Clion And Conan
# http://blog.conan.io/2016/05/10/Programming-C++-with-the-4-Cs-Clang,-CMake,-CLion-and-Conan.html

# A Timer using POCO Libraries
# https://conanio.readthedocs.io/en/latest/getting_started.html#a-timer-using-poco-libraries

set -x

export DEBIAN_FRONTEND=noninteractive
export WORKSPACE_DIR=/workspace
export THIRDPARTY_DIR=${WORKSPACE_DIR}/3rdparty
export EXAMPLE_DIR=${THIRDPARTY_DIR}/conan-gtest-example-master
export BUILD_DIR=${EXAMPLE_DIR}/build

if [ "$PWD" != "$WORKSPACE_DIR" ]; then
  echo "Build helper script to be run inside a container."
  echo "Go to $WORKSPACE_DIR directory before running this script."
  exit 1
fi

mkdir -p ${BUILD_DIR} \
  && cd ${BUILD_DIR}

cd ${BUILD_DIR} \
  && conan install .. \
  --settings compiler=gcc \
  --settings compiler.version=6.3 \
  --settings compiler.libcxx=libstdc++11 \
  --build=missing

# cd ${BUILD_DIR} \
#   && cmake .. \
#   -G "Unix Makefiles" \
#   -DCMAKE_BUILD_TYPE=Release \
#   && cmake --build . \
#   && find ${PWD}/lib

cd ${BUILD_DIR} \
  && conan build .. \
  && find ${PWD}/lib
