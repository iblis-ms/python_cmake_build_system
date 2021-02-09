# Author: Marcin Serwach
# License: MIT
# ULR: https://github.com/iblis-ms/python_cmake_build_system

CMake_minimum_required(VERSION 3.16.3 FATAL_ERROR) 

project(SingleExecProject)
include("${CMAKE_CURRENT_SOURCE_DIR}/../build/addTarget.cmake")


set(SRC_DIR  "${CMAKE_CURRENT_SOURCE_DIR}/src")
set(INC_DIR  "${CMAKE_CURRENT_SOURCE_DIR}/inc")

set(SRC
    "${SRC_DIR}/main.cpp"
    "${SRC_DIR}/MyClass.cpp"
	)

AddExeTarget(
    TARGET_NAME "SingleExec"
    PUBLIC_INC_DIRS "${INC_DIR}"
    SRC "${SRC}"
	)
