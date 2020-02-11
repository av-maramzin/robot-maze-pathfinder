#!/bin/bash

source $(dirname "$0")/include/project-environment.sh

echo "< build-robot.sh script >"
echo "=> Building robot executable"

if [[ -e ${BUILD_DIR} ]]; then
    rm -rf ${BUILD_DIR}
fi
mkdir ${BUILD_DIR}

C_FLAGS=""

(
cd ${BUILD_DIR}
echo "=> CMake is generating build system"
CC=gcc CXX=g++ cmake \
    -G "Unix Makefiles" \
    -DCMAKE_BUILD_TYPE=Debug \
    -DCMAKE_C_FLAGS="${C_FLAGS}" \
    "${PROJECT_ROOT_DIR}"
echo "=> Building robot executable"
cmake --build .
)

echo "=> Robot build script finished!"
