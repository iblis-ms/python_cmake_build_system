
cmake_minimum_required(VERSION 3.16)
project(MultiTargetProject)
include("${CMAKE_CURRENT_SOURCE_DIR}/../build/addTarget.cmake")

set(FACTORIAL_SRC "${CMAKE_CURRENT_SOURCE_DIR}/src/Factorial.cpp")
set(FACTORIAL_INC "${CMAKE_CURRENT_SOURCE_DIR}/inc")

enable_testing()
add_subdirectory(tests)
add_subdirectory(benchmarks)