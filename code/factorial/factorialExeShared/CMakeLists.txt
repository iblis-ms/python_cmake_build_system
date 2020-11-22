# Author: Marcin Serwach
# License: MIT
# ULR: https://github.com/iblis-ms/python_cmake_build_system

set(SRC
	"${CMAKE_CURRENT_SOURCE_DIR}/src/main.cpp"
	)

addTarget(
    TARGET_NAME "FactorialShared"
    TARGET_TYPE "EXE"
    SRC "${SRC}"
    PUBLIC_LIBS "FactorialSharedLib" 
	)

