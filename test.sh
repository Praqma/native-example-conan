#!/usr/bin/env bash

# Programming C++ With The 4 Cs: Clang, Cmake, Clion And Conan
# http://blog.conan.io/2016/05/10/Programming-C++-with-the-4-Cs-Clang,-CMake,-CLion-and-Conan.html

# A Timer using POCO Libraries
# https://conanio.readthedocs.io/en/latest/getting_started.html#a-timer-using-poco-libraries

set -x

export DEBIAN_FRONTEND=noninteractive
export DEBCONF_NONINTERACTIVE_SEEN=true

export WORKSPACE_DIR=/workspace
export THIRDPARTY_DIR=${WORKSPACE_DIR}/3rdparty
export EXAMPLE_DIR=${THIRDPARTY_DIR}/conan-gtest-example-master

if [ "$PWD" != "$WORKSPACE_DIR" ]; then
  echo "Test helper script to be run inside a container."
  echo "Go to $WORKSPACE_DIR directory before running this script."
  exit 1
fi

cd ${EXAMPLE_DIR}
sed --in-place=.bak 's/1.0.2l/1.0.2o/g' conanfile.py
sed --in-place=.bak 's/1.7.0\@lasote/1.8.1\@bincrafters/g' test_package/conanfile.py
conan test_package . whatevername/whateverchannel

