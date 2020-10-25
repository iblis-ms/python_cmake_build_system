
set(SRC_TEST
	"${CMAKE_CURRENT_SOURCE_DIR}/src/MainClassTest.cpp"
	)

addTestTarget(
        TARGET_NAME "FactorialTest"
        TARGET_TYPE "EXE"
        SRC "${SRC}" "${SRC_TEST}"
        PRIVATE_INC_DIRS "${INC}"
        PUBLIC_LIBS "FactorialIterative" "FactorialRecursive"
	)