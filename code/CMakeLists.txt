# Author: Marcin Serwach
# License: MIT
# ULR: https://github.com/iblis-ms/python_cmake_build_system

CMake_minimum_required(VERSION 3.16.3 FATAL_ERROR) 

project(TestApp)
include("${CMAKE_SOURCE_DIR}/../build/addTarget.cmake")

set(CMAKE_CXX_STANDARD_REQUIRED ON)
############################### CONAN releated part ########################################

enable_testing()
add_subdirectory(factorial)

