set(SRC
	"${CMAKE_CURRENT_SOURCE_DIR}/src/main.cpp"
	)

addTarget(
        TARGET_NAME "FactorialStatic"
        TARGET_TYPE "EXE"
        SRC "${SRC}"
        PUBLIC_LIBS "FactorialStaticLib" 
	)

