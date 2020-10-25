
set(SRC_TEST
	"${CMAKE_CURRENT_SOURCE_DIR}/src/FactorialFactoryIterativeTest.cpp"
	"${CMAKE_CURRENT_SOURCE_DIR}/src/FactorialIterativeTest.cpp"
	)

addTestTarget(
        TARGET_NAME "FactorialIterativeTest"
        TARGET_TYPE "EXE"
        SRC "${SRC}" "${SRC_TEST}"
        PUBLIC_INC_DIRS "${INTERFACE}"
        PRIVATE_INC_DIRS "${INC}"
        PUBLIC_LIBS "FactorialInterface"
	)