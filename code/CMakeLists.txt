# Author: Marcin Serwach
# License: MIT
# ULR: https://github.com/iblis-ms/python_cmake_build_system

CMake_minimum_required(VERSION 3.17.2 FATAL_ERROR) 

project(TestApp)

############################### CONAN releated part ########################################

set(CONAN_CMAKE_FILE "${CMAKE_CURRENT_SOURCE_DIR}/conan.cmake") # set path to file

if(NOT EXISTS "${CONAN_CMAKE_FILE}") # if not exist, download it
   message(STATUS "Downloading conan.cmake from https://github.com/conan-io/cmake-conan")
   file(DOWNLOAD "https://github.com/conan-io/cmake-conan/raw/v0.15/conan.cmake"
                 "${CONAN_CMAKE_FILE}")
endif()

include("${CONAN_CMAKE_FILE}") # include file to use functions from it.

set(CONAN_FILE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/conanfile.txt") # Path to conanfile.txt which says what libraries are required

file(RELATIVE_PATH CONAN_FILE_RELATIVE_PATH "${CMAKE_SOURCE_DIR}" "${CONAN_FILE_PATH}") # conan_cmake_run requires relative path

# Note that build type, architecture is detected by CMake, but you can overwrite it
# see https://github.com/conan-io/cmake-conan for details
conan_cmake_run(CONANFILE "${CONAN_FILE_RELATIVE_PATH}"
                BASIC_SETUP         # calls conan_basic_setup: https://docs.conan.io/en/latest/reference/generators/cmake.html
                CMAKE_TARGETS       # to use modern CMake approach: target_* function
                BUILD missing)      # build library if missing 

########################## CMake target releated part ######################################

set(SRC_DIR "${CMAKE_CURRENT_SOURCE_DIR}/src")

set(SRC
	"${SRC_DIR}/TestApp.cpp"
	)
	
add_executable(TestApplication "${SRC}")

################## Link CMake target with libraries download by Conan ######################

conan_target_link_libraries(TestApplication)