
set(SRC_TEST
	"${CMAKE_CURRENT_SOURCE_DIR}/src/MainClassTest.cpp"
	)

addTestTarget(
        TARGET_NAME "FactorialStaticTest"
        TARGET_TYPE "EXE"
        SRC "${SRC}" "${SRC_TEST}"
        PRIVATE_INC_DIRS "${INTERFACE}"
        PUBLIC_LIBS "FactorialIterative" "FactorialRecursive"
	)