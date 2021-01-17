# Author: Marcin Serwach
# License: MIT
# ULR: https://github.com/iblis-ms/python_cmake_build_system

set(SRC
    "${CMAKE_CURRENT_SOURCE_DIR}/src/FactorialFactoryIterative.cpp"
    "${CMAKE_CURRENT_SOURCE_DIR}/src/FactorialIterative.cpp"
    )

set(INC 
    "${CMAKE_CURRENT_SOURCE_DIR}/inc"
    )

set(INTERFACE
    "${CMAKE_CURRENT_SOURCE_DIR}/interface"
    )

set(RES_COPY_TO_EXE_DIR
    "${CMAKE_CURRENT_SOURCE_DIR}/res/iterative.txt"
    "${CMAKE_CURRENT_SOURCE_DIR}/res/iterative_res"
    )

set(RES_COPY
    "${CMAKE_CURRENT_SOURCE_DIR}/res/iterative2.txt" TO "${CMAKE_BINARY_DIR}"
    "${CMAKE_CURRENT_SOURCE_DIR}/res/iterative_res2" TO "${CMAKE_BINARY_DIR}"
    )

addTarget(
    TARGET_NAME "FactorialIterative"
    TARGET_TYPE "STATIC"
    SRC "${SRC}"
    PUBLIC_INC_DIRS "${INTERFACE}"
    PRIVATE_INC_DIRS "${INC}"
    PUBLIC_LIBS "FactorialInterface"
    RESOURCES_TO_COPY_TO_EXE_DIR "${RES_COPY_TO_EXE_DIR}"
    RESOURCES_TO_COPY "${RES_COPY}"
    )

add_subdirectory(tests)
add_subdirectory(benchmark)
