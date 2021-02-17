AddBenchmarkTarget(
    TARGET_NAME "FactorialRecursiveBenchmark"
    SRC "${CMAKE_CURRENT_SOURCE_DIR}/src/FactorialRecursiveBenchmark.cpp" "${FACTORIAL_SRC}"
    PUBLIC_INC_DIRS "${FACTORIAL_INC}"
    )