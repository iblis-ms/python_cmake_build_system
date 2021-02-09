
addTestTarget(
    TARGET_NAME "FactorialRecursiveTest"
    SRC "${FACTORIAL_SRC}"
    TEST_SRC "${CMAKE_CURRENT_SOURCE_DIR}/src/FactorialRecursiveTest.cpp"
    PUBLIC_INC_DIRS "${FACTORIAL_INC}"
    )
