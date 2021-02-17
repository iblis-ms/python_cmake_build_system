# Author: Marcin Serwach
# License: MIT
# ULR: https://github.com/iblis-ms/python_cmake_build_system

CMake_minimum_required(VERSION 3.16.3 FATAL_ERROR) 

project(SingleExecProject)
include("${CMAKE_CURRENT_SOURCE_DIR}/../build/addTarget.cmake")

set(SRC_DIR  "${CMAKE_CURRENT_SOURCE_DIR}/src")

set(SRC
    "${SRC_DIR}/main.cpp"
	)

AddExeTarget(
    TARGET_NAME "CompilerProfileExe"
    SRC "${SRC}"
	)
