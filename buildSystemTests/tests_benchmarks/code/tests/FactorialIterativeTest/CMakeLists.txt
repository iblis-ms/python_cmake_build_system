
addTestTarget(
    TARGET_NAME "FactorialIterativeTest"
    SRC "${FACTORIAL_SRC}"
    TEST_SRC "${CMAKE_CURRENT_SOURCE_DIR}/src/FactorialIterativeTest.cpp"
    PUBLIC_INC_DIRS "${FACTORIAL_INC}"
    )
