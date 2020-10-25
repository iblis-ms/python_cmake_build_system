set(SRC
	"${CMAKE_CURRENT_SOURCE_DIR}/src/FactorialFactoryRecursive.cpp"
	"${CMAKE_CURRENT_SOURCE_DIR}/src/FactorialRecursive.cpp"
	)

set(INC 
	"${CMAKE_CURRENT_SOURCE_DIR}/inc"
	)

set(INTERFACE
	"${CMAKE_CURRENT_SOURCE_DIR}/interface"
	)


addTarget(
        TARGET_NAME "FactorialRecursive"
        TARGET_TYPE "STATIC"
        SRC "${SRC}"
        PUBLIC_INC_DIRS "${INTERFACE}"
        PRIVATE_INC_DIRS "${INC}"
        PUBLIC_LIBS "FactorialInterface"
	)

add_subdirectory(tests)