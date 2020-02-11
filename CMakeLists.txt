cmake_minimum_required (VERSION 2.6)
project(robot-maze-pathfinder)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++14")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fno-rtti")

set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS} -g -O0")

include_directories(include)

file(GLOB SOURCES src/*.cpp)

add_executable(robot MODULE ${SOURCES})

install(TARGETS robot DESTINATION build)
