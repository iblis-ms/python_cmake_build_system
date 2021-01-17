
#include <benchmark/benchmark.h>
#include "FactorialRecursive.hpp"

void Benchmark_factorial_optimisation(benchmark::State& aState)
{
  const int value = aState.range(0);
  while (aState.KeepRunning())
  {
      CFactorialRecursive recursive;
      benchmark::DoNotOptimize(recursive.calc(value));
        benchmark::ClobberMemory();

  }
}

BENCHMARK(Benchmark_factorial_optimisation)->Range(2, 1<<15);

BENCHMARK_MAIN();