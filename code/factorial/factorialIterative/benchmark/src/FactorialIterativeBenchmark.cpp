
#include <benchmark/benchmark.h>
#include "FactorialIterative.hpp"


void Benchmark_factorial_optimisation(benchmark::State& aState)
{
  const int value = aState.range(0);
  while (aState.KeepRunning())
  {
      CFactorialIterative iterative;
      benchmark::DoNotOptimize(iterative.calc(value));
        benchmark::ClobberMemory();

  }
}

BENCHMARK(Benchmark_factorial_optimisation)->Range(2, 1<<15);

BENCHMARK_MAIN();