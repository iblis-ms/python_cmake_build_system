set(SRC
	"${CMAKE_CURRENT_SOURCE_DIR}/src/FactorialFactoryIterative.cpp"
	"${CMAKE_CURRENT_SOURCE_DIR}/src/FactorialIterative.cpp"
	)

set(INC 
	"${CMAKE_CURRENT_SOURCE_DIR}/inc"
	)

set(INTERFACE
	"${CMAKE_CURRENT_SOURCE_DIR}/interface"
	)


addTarget(
        TARGET_NAME "FactorialIterative"
        TARGET_TYPE "STATIC"
        SRC "${SRC}"
        PUBLIC_INC_DIRS "${INTERFACE}"
        PRIVATE_INC_DIRS "${INC}"
        PUBLIC_LIBS "FactorialInterface"
	)

add_subdirectory(tests)
