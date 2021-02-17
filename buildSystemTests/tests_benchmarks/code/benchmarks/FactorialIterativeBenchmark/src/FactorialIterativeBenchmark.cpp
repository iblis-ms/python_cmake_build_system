#include <benchmark/benchmark.h>
#include "Factorial.hpp"


void Benchmark_factorial_iterative(benchmark::State& aState)
{
    const int value = aState.range(0);
    while (aState.KeepRunning())
    {
        benchmark::DoNotOptimize(factorialIterative(value));
        benchmark::ClobberMemory();

    }
}

BENCHMARK(Benchmark_factorial_iterative)->Range(2, 1<<15);

BENCHMARK_MAIN();