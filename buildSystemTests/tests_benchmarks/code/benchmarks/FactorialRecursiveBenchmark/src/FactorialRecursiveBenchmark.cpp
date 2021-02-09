#include <benchmark/benchmark.h>
#include "Factorial.hpp"


void Benchmark_factorial_recursive(benchmark::State& aState)
{
    const int value = aState.range(0);
    while (aState.KeepRunning())
    {
        benchmark::DoNotOptimize(factorialRecursive(value));
        benchmark::ClobberMemory();

    }
}

BENCHMARK(Benchmark_factorial_recursive)->Range(2, 1<<15);

BENCHMARK_MAIN();