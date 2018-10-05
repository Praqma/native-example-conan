#!/usr/bin/env bash
set -x

export DEBIAN_FRONTEND=noninteractive
export DEBCONF_NONINTERACTIVE_SEEN=true

export WORKSPACE_DIR=/workspace
export THIRDPARTY_DIR=${WORKSPACE_DIR}/3rdparty
export EXAMPLE_DIR=${THIRDPARTY_DIR}/conan-gtest-example-master
export BUILD_DIR=${EXAMPLE_DIR}/build
export GRAPH_DIR=${BUILD_DIR}/graph

if [ "$PWD" != "$WORKSPACE_DIR" ]; then
  echo "Build helper script to be run inside a container."
  echo "Go to $WORKSPACE_DIR directory before running this script."
  exit 1
fi

mkdir -p ${BUILD_DIR} ${GRAPH_DIR}

# cd ${BUILD_DIR} \
#   && conan create user/channel --cwd=.. --build \
#   && conan info --cwd=.. --graph=${GRAPH_DIR}/dependencies.html \
#   && conan info --cwd=.. --graph=${GRAPH_DIR}/dependencies.dot \
#   && find ${BUILD_DIR}

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
#   && find ${BUILD_DIR}/lib

cd ${BUILD_DIR} \
  && conan build .. \
  && conan info .. --graph=${GRAPH_DIR}/dependencies.html \
  && conan info .. --graph=${GRAPH_DIR}/dependencies.dot \
  && find ${BUILD_DIR}/lib \
  && find ${GRAPH_DIR}
