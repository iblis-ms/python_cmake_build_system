
set(SRC_TEST
    "${CMAKE_CURRENT_SOURCE_DIR}/src/FactorialFactoryIterativeTest.cpp"
    "${CMAKE_CURRENT_SOURCE_DIR}/src/FactorialIterativeTest.cpp"
    )

set(RES_FILE 
    "${CMAKE_CURRENT_SOURCE_DIR}/res/iterative_1.txt"
    "${CMAKE_CURRENT_SOURCE_DIR}/res/iterative_2.txt"
    "${CMAKE_CURRENT_SOURCE_DIR}/res/iterative_3.txt"
    "${CMAKE_CURRENT_SOURCE_DIR}/res/iterative_4.txt"
    "${CMAKE_CURRENT_SOURCE_DIR}/res/iterative_5.txt"
    "${CMAKE_CURRENT_SOURCE_DIR}/res/iterative_6.txt"
    "${CMAKE_CURRENT_SOURCE_DIR}/res/iterative_dir")

addTestTarget(
    TARGET_NAME "FactorialIterativeTest"
    TARGET_TYPE "EXE"
    SRC "${SRC}" "${SRC_TEST}"
    PUBLIC_INC_DIRS "${INTERFACE}"
    PRIVATE_INC_DIRS "${INC}"
    PUBLIC_LIBS "FactorialInterface"
    RESOURCES_TO_COPY_TO_EXE_DIR "${RES_FILE}"
    )
