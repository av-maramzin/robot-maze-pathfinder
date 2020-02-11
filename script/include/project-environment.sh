#!/bin/bash

error_exit() {
    echo "$1"
    exit 1
}

STATUS_MSG=""

# [1] check that script is being launched from the project root directory;
# stop and redirect the user to the right directory otherwise; 
STATUS_MSG="Checking script launch directory"
echo $STATUS_MSG
declare -a PROJECT_ROOT_SIGNS=("CMakeLists.txt" # PPar tool buildsystem generation CMake rules 
                               "README.md" # GitHub's README file 
                               ".gitmodules") # Git repository stuff
ERROR_MSG_BASE="Error: the script cannot be launched from this directory! Use the root directory of the project instead."
for file in ${PROJECT_ROOT_SIGNS[@]}; do
    if [ ! -f ${file} ]; then
        ERROR_MSG="${ERROR_MSG_BASE} Could not find a file named ${file}, which is supposed to be present in the root directory."
        error_exit "${ERROR_MSG}"
    fi
done
STATUS_MSG="Script launch directory: OK"
echo $STATUS_MSG

# project directory layout information
PROJECT_ROOT_DIR="${PWD}" # project root directory
SRC_DIR="${PROJECT_ROOT_DIR}/src"
INCLUDE_DIR="${PROJECT_ROOT_DIR}/include"
SCRIPTS_DIR="${PROJECT_ROOT_DIR}/scripts"
INPUT_DIR="${PROJECT_ROOT_DIR}/input"
BUILD_DIR="${PROJECT_ROOT_DIR}/build"

# [2] perform a quick repository integrity check;
# stop and complain if some necessary repository pieces are missing; 
STATUS_MSG="Checking repository integrity"
echo $STATUS_MSG
declare -a PROJECT_SOURCE_DIRS=("${SRC_DIR}"
                                "${INCLUDE_DIR}"
                                "${INPUT_DIR}"
                                "${SCRIPTS_DIR}")
ERROR_MSG_BASE="Error: the script cannot be launched from an incomplete repository!"
for dir in ${PROJECT_SOURCE_DIRS[@]}; do
    if [ ! -d ${dir} ]; then
        ERROR_MSG="${ERROR_MSG_BASE} Necessary ${dir} PPar project directory is missing!"
        error_exit "${ERROR_MSG}"
    fi
done
STATUS_MSG="Repository integrity: OK"
echo $STATUS_MSG

