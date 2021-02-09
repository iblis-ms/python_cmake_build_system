AddBenchmarkTarget(
    TARGET_NAME "FactorialIterativeBenchmark"
    SRC "${CMAKE_CURRENT_SOURCE_DIR}/src/FactorialIterativeBenchmark.cpp" "${FACTORIAL_SRC}"
    PUBLIC_INC_DIRS "${FACTORIAL_INC}"
    )