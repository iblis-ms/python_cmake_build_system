# Author: Marcin Serwach
# License: MIT
# ULR: https://github.com/iblis-ms/python_cmake_build_system

set(SRC_TEST
    "${CMAKE_CURRENT_SOURCE_DIR}/src/FactorialFactoryRecursiveTest.cpp"
    "${CMAKE_CURRENT_SOURCE_DIR}/src/FactorialRecursiveTest.cpp"
    )

set(RES_FILE 
    "${CMAKE_CURRENT_SOURCE_DIR}/res/recursive_1.txt"
    "${CMAKE_CURRENT_SOURCE_DIR}/res/recursive_2.txt"
    "${CMAKE_CURRENT_SOURCE_DIR}/res/recursive_3.txt"
    "${CMAKE_CURRENT_SOURCE_DIR}/res/recursive_4.txt"
    "${CMAKE_CURRENT_SOURCE_DIR}/res/recursive_5.txt"
    "${CMAKE_CURRENT_SOURCE_DIR}/res/recursive_6.txt"
    "${CMAKE_CURRENT_SOURCE_DIR}/res/recursive_dir")
    
addTestTarget(
    TARGET_NAME "FactorialRecursiveTest"
    TARGET_TYPE "EXE"
    SRC "${SRC}" 
    TEST_SRC "${SRC_TEST}"
    PUBLIC_INC_DIRS "${INTERFACE}"
    PRIVATE_INC_DIRS "${INC}"
    PUBLIC_LIBS "FactorialInterface"
    RESOURCES_TO_COPY_TO_EXE_DIR "${RES_FILE}"
    TARGET_OUTPUT_DIR "${CMAKE_BINARY_DIR}/tests/FactorialRecursiveTests"
    )
    