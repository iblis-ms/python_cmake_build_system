
########################## CMake target releated part ######################################

set(SRC_DIR "${CMAKE_CURRENT_SOURCE_DIR}/src")

set(SRC
	"${SRC_DIR}/Tests.cpp"
	)
	
AddTestTarget(TARGET_NAME "TestExec"
	TARGET_TYPE "EXE"
	SRC "${SRC}"
	PUBLIC_LIBS "Library"
	)
