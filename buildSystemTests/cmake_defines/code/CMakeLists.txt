# Author: Marcin Serwach
# License: MIT
# ULR: https://github.com/iblis-ms/python_cmake_build_system

CMake_minimum_required(VERSION 3.16.3 FATAL_ERROR) 

project(CMakeDefinesProject)


if (THIS_IS_CMAKE_DEFINE)
	file(WRITE "${CMAKE_BINARY_DIR}/output_file.txt" "value=${THIS_IS_ANOTHER_CMAKE_DEFINE}")
endif()
