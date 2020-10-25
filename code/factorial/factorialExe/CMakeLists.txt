set(SRC
	"${CMAKE_CURRENT_SOURCE_DIR}/src/MainClass.cpp"
	"${CMAKE_CURRENT_SOURCE_DIR}/src/main.cpp"
	)

set(INC 
	"${CMAKE_CURRENT_SOURCE_DIR}/inc"
	)


addTarget(
        TARGET_NAME "Factorial"
        TARGET_TYPE "EXE"
        SRC "${SRC}"
        PRIVATE_INC_DIRS "${INC}"
        PUBLIC_LIBS "FactorialIterative" "FactorialRecursive"
	)

add_subdirectory(tests)
