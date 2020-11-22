# Author: Marcin Serwach
# License: MIT
# ULR: https://github.com/iblis-ms/python_cmake_build_system

set(SRC
	"${CMAKE_CURRENT_SOURCE_DIR}/src/MainClass.cpp"
	)

set(INTERFACE 
	"${CMAKE_CURRENT_SOURCE_DIR}/interface"
	)


addTarget(
    TARGET_NAME "FactorialStaticLib"
    TARGET_TYPE "STATIC"
    SRC "${SRC}"
    PUBLIC_INC_DIRS "${INTERFACE}"
    PUBLIC_LIBS "FactorialIterative" "FactorialRecursive"
	)

