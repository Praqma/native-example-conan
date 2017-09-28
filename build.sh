#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive
export THIRDPARTY_DIR=${PWD}/3rdparty
export EXAMPLE_DIR=${THIRDPARTY_DIR}/four-c-example-master

mkdir ${EXAMPLE_DIR}/.conan \
  && cd ${EXAMPLE_DIR}/.conan

conan install ${EXAMPLE_DIR} \
  -s compiler=clang \
  -s compiler.version=4.0 \
  -s compiler.libcxx=libstdc++11 \
  --build=missing

cmake ${EXAMPLE_DIR} -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release
cmake --build ${PWD}
${PWD}/bin/timer
