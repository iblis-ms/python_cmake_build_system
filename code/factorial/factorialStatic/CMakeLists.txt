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

#add_subdirectory(tests)
