# Author: Marcin Serwach
# License: MIT
# ULR: https://github.com/iblis-ms/python_cmake_build_system

addTarget(
    TARGET_NAME "FactorialInterface"
    TARGET_TYPE "INTERFACE"
    PUBLIC_INC_DIRS "${CMAKE_CURRENT_SOURCE_DIR}/interface"
	)