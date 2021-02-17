# Author: Marcin Serwach
# License: MIT
# ULR: https://github.com/iblis-ms/python_cmake_build_system

set(SRC_BENCHMARK
    "${CMAKE_CURRENT_SOURCE_DIR}/src/FactorialRecursiveBenchmark.cpp"
    )
 
AddBenchmarkTarget(
    TARGET_NAME "FactorialRecursiveeBenchmark"
    TARGET_TYPE "EXE"
    SRC "${SRC}" "${SRC_BENCHMARK}"
    PUBLIC_INC_DIRS "${INTERFACE}"
    PRIVATE_INC_DIRS "${INC}"
    PUBLIC_LIBS "FactorialInterface"
    )
