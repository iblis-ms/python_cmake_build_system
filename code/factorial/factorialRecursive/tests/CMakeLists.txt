
set(SRC_TEST
	"${CMAKE_CURRENT_SOURCE_DIR}/src/FactorialFactoryRecursiveTest.cpp"
	"${CMAKE_CURRENT_SOURCE_DIR}/src/FactorialRecursiveTest.cpp"
	)

addTestTarget(
        TARGET_NAME "FactorialRecursiveTest"
        TARGET_TYPE "EXE"
        SRC "${SRC}" "${SRC_TEST}"
        PUBLIC_INC_DIRS "${INTERFACE}"
        PRIVATE_INC_DIRS "${INC}"
        PUBLIC_LIBS "FactorialInterface"
	)