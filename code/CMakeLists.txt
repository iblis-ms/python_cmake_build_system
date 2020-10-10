# Author: Marcin Serwach
# License: MIT
# ULR: https://github.com/iblis-ms/python_cmake_build_system

CMake_minimum_required(VERSION 3.17.2 FATAL_ERROR) 

project(TestApp)
include("${CMAKE_SOURCE_DIR}/../build/addTarget.cmake")

set(CMAKE_CXX_STANDARD_REQUIRED ON)
############################### CONAN releated part ########################################

set(CONAN_CMAKE_FILE "${CMAKE_CURRENT_SOURCE_DIR}/conan.cmake") # set path to file

if(NOT EXISTS "${CONAN_CMAKE_FILE}") # if not exist, download it
   message(STATUS "Downloading conan.cmake from https://github.com/conan-io/cmake-conan")
   file(DOWNLOAD "https://github.com/conan-io/cmake-conan/raw/v0.15/conan.cmake"
                 "${CONAN_CMAKE_FILE}")
endif()

include("${CONAN_CMAKE_FILE}") # include file to use functions from it.


add_subdirectory(lib)
enable_testing()
add_subdirectory(tests)