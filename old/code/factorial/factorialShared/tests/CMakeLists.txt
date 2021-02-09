# Author: Marcin Serwach
# License: MIT
# ULR: https://github.com/iblis-ms/python_cmake_build_system

set(SRC_TEST
	"${CMAKE_CURRENT_SOURCE_DIR}/src/MainClassTest.cpp"
	)

addTestTarget(
    TARGET_NAME "FactorialSharedTest"
    TARGET_TYPE "EXE"
    SRC "${SRC}" 
    TEST_SRC "${SRC_TEST}"
    PRIVATE_INC_DIRS "${INTERFACE}"
    PUBLIC_LIBS "FactorialIterative" "FactorialRecursive"
	)