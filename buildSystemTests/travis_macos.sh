#!/bin/bash

set -e

cp -r ../build cmake_defines
cp -r ../build.py cmake_defines

cp -r ../build compiler_profile
cp -r ../build.py compiler_profile

cp -r ../build multi_targets_project
cp -r ../build.py multi_targets_project

cp -r ../build sanitizers_issues
cp -r ../build.py sanitizers_issues

cp -r ../build single_exec
cp -r ../build.py single_exec

cp -r ../build tests_benchmarks
cp -r ../build.py tests_benchmarks




echo 'begin: test_buildAndRunBenchmarksFilter_output_Unix_Makefiles_clang_clang__Debug_None'
cd tests_benchmarks
python3 build.py --generator "Unix Makefiles" --profile Debug --c_compiler clang --cxx_compiler clang++ --clean --run_benchmarks --benchmark_filter Benchmark_factorial_iterative --output output_Unix_Makefiles_clang_clang++_Debug_None
cd ../
echo 'end: test_buildAndRunBenchmarksFilter_output_Unix_Makefiles_clang_clang__Debug_None'

echo 'begin: test_buildAndRunBenchmarksFilter_output_Unix_Makefiles_clang_clang__Release_None'
cd tests_benchmarks
python3 build.py --generator "Unix Makefiles" --profile Release --c_compiler clang --cxx_compiler clang++ --clean --run_benchmarks --benchmark_filter Benchmark_factorial_iterative --output output_Unix_Makefiles_clang_clang++_Release_None
cd ../
echo 'end: test_buildAndRunBenchmarksFilter_output_Unix_Makefiles_clang_clang__Release_None'


echo 'begin: test_buildAndRunBenchmarksFilter_output_Unix_Makefiles_gcc_g__Debug_None'
cd tests_benchmarks
python3 build.py --generator "Unix Makefiles" --profile Debug --c_compiler gcc --cxx_compiler g++ --clean --run_benchmarks --benchmark_filter Benchmark_factorial_iterative --output output_Unix_Makefiles_gcc_g++_Debug_None
cd ../
echo 'end: test_buildAndRunBenchmarksFilter_output_Unix_Makefiles_gcc_g__Debug_None'


echo 'begin: test_buildAndRunBenchmarksFilter_output_Unix_Makefiles_gcc_g__Release_None'
cd tests_benchmarks
python3 build.py --generator "Unix Makefiles" --profile Release --c_compiler gcc --cxx_compiler g++ --clean --run_benchmarks --benchmark_filter Benchmark_factorial_iterative --output output_Unix_Makefiles_gcc_g++_Release_None
cd ../
echo 'end: test_buildAndRunBenchmarksFilter_output_Unix_Makefiles_gcc_g__Release_None'


echo 'begin: test_buildAndRunBenchmarksFilter_output_Xcode_clang_clang__Debug_None'
cd tests_benchmarks
python3 build.py --generator "Unix Makefiles" --profile Release --c_compiler gcc --cxx_compiler g++ --clean --run_benchmarks --benchmark_filter Benchmark_factorial_iterative --output output_Unix_Makefiles_gcc_g++_Release_None
cd ../
echo 'end: test_buildAndRunBenchmarksFilter_output_Xcode_clang_clang__Debug_None'


echo 'begin: test_buildAndRunBenchmarksFilter_output_Xcode_clang_clang__Debug_None'
cd tests_benchmarks
python3 build.py --generator "Xcode" --profile Release --c_compiler gcc --cxx_compiler g++ --clean --run_benchmarks --benchmark_filter Benchmark_factorial_iterative --output output_Xcode_clang_clang++_Debug_None
cd ../
echo 'end: test_buildAndRunBenchmarksFilter_output_Xcode_clang_clang__Debug_None'



echo 'begin: test_buildAndRunBenchmarksFilter_output_Xcode_clang_clang__Release_None'
cd tests_benchmarks
python3 build.py --generator Xcode --profile Release --c_compiler clang --cxx_compiler clang++ --clean --run_benchmarks --benchmark_filter Benchmark_factorial_iterative --output output_Xcode_clang_clang++_Release_None
cd ../
echo 'end: test_buildAndRunBenchmarksFilter_output_Xcode_clang_clang__Release_None'



echo 'begin: test_buildAndRunBenchmarksFilter_output_Xcode_gcc_g__Debug_None'
cd tests_benchmarks
python3 build.py --generator Xcode --profile Debug --c_compiler gcc --cxx_compiler g++ --clean --run_benchmarks --benchmark_filter Benchmark_factorial_iterative --output output_Xcode_gcc_g++_Debug_None
cd ../
echo 'end: test_buildAndRunBenchmarksFilter_output_Xcode_gcc_g__Debug_None'

echo 'begin: test_buildAndRunBenchmarksFilter_output_Xcode_gcc_g__Release_None'
cd tests_benchmarks
python3 build.py --generator Xcode --profile Release --c_compiler gcc --cxx_compiler g++ --clean --run_benchmarks --benchmark_filter Benchmark_factorial_iterative --output output_Xcode_gcc_g++_Release_None
cd ../
echo 'end: test_buildAndRunBenchmarksFilter_output_Xcode_gcc_g__Release_None'


echo 'begin: test_buildAndRunBenchmarks_output_Unix_Makefiles_clang_clang__Debug_None'
cd tests_benchmarks
python3 build.py --generator "Unix Makefiles" --profile Debug --c_compiler clang --cxx_compiler clang++ --clean --run_benchmarks --output output_Unix_Makefiles_clang_clang++_Debug_None
cd ../
echo 'end: test_buildAndRunBenchmarks_output_Unix_Makefiles_clang_clang__Debug_None'

echo 'begin: test_buildAndRunBenchmarks_output_Unix_Makefiles_clang_clang__Release_None'
cd tests_benchmarks
python3 build.py --generator "Unix Makefiles" --profile Release --c_compiler clang --cxx_compiler clang++ --clean --run_benchmarks --output output_Unix_Makefiles_clang_clang++_Release_None
cd ../
echo 'end: test_buildAndRunBenchmarks_output_Unix_Makefiles_clang_clang__Release_None'


echo 'begin: test_buildAndRunBenchmarks_output_Unix_Makefiles_gcc_g__Debug_None'
cd tests_benchmarks
python3 build.py --generator "Unix Makefiles" --profile Debug --c_compiler clang --cxx_compiler clang++ --clean --run_benchmarks --output output_Unix_Makefiles_clang_clang++_Debug_None
cd ../
echo 'end: test_buildAndRunBenchmarks_output_Unix_Makefiles_gcc_g__Debug_None'




echo 'begin: test_buildAndRunTestsBenchmarks_output_Unix_Makefiles_clang_clang__Release_None'
cd tests_benchmarks
python3 build.py --generator "Unix Makefiles" --profile Release --c_compiler clang --cxx_compiler clang++ --clean --run_tests --run_benchmarks --output output_Unix_Makefiles_clang_clang++_Release_None
cd ../
echo 'end: test_buildAndRunTestsBenchmarks_output_Unix_Makefiles_clang_clang__Release_None'


echo 'begin: test_buildAndRunTestsBenchmarks_output_Unix_Makefiles_gcc_g__Release_None'
cd tests_benchmarks
python3 build.py --generator "Unix Makefiles" --profile Release --c_compiler gcc --cxx_compiler g++ --clean --run_tests --run_benchmarks --output output_Unix_Makefiles_gcc_g++_Release_None
cd ../
echo 'end: test_buildAndRunTestsBenchmarks_output_Unix_Makefiles_gcc_g__Release_None'


echo 'begin: test_buildAndRunTestsBenchmarks_output_Xcode_clang_clang__Release_None'
cd tests_benchmarks
python3 build.py --generator Xcode --profile Release --c_compiler clang --cxx_compiler clang++ --clean --run_tests --run_benchmarks --output  output_Xcode_clang_clang++_Release_None
cd ../
echo 'end: test_buildAndRunTestsBenchmarks_output_Xcode_clang_clang__Release_None'

echo 'begin: test_buildAndRunTestsBenchmarks_output_Xcode_gcc_g__Release_None'
cd tests_benchmarks
python3 build.py --generator Xcode --profile Release --c_compiler gcc --cxx_compiler g++ --clean --run_tests --run_benchmarks --output output_Xcode_gcc_g++_Release_None
cd ../
echo 'end: test_buildAndRunTestsBenchmarks_output_Xcode_gcc_g__Release_None'




echo 'begin: test_buildAndRunTestsFilter_output_Unix_Makefiles_clang_clang__Release_None'
cd tests_benchmarks
python3 build.py --generator "Unix Makefiles" --profile Release --c_compiler clang --cxx_compiler clang++ --clean --run_tests --gtest_filter Factorial.Iteative0 --output output_Unix_Makefiles_clang_clang++_Release_None
cd ../
echo 'end: test_buildAndRunTestsFilter_output_Unix_Makefiles_clang_clang__Release_None'


echo 'begin: test_buildAndRunTestsFilter_output_Unix_Makefiles_gcc_g__Release_None'
cd tests_benchmarks
python3 build.py --generator "Unix Makefiles" --profile Release --c_compiler gcc --cxx_compiler g++ --clean --run_tests --gtest_filter Factorial.Iteative0 --output output_Unix_Makefiles_gcc_g++_Release_None
cd ../
echo 'end: test_buildAndRunTestsFilter_output_Unix_Makefiles_gcc_g__Release_None'


echo 'begin: test_buildAndRunTestsFilter_output_Xcode_clang_clang__Release_None'
cd tests_benchmarks
python3 build.py --generator Xcode --profile Release --c_compiler clang --cxx_compiler clang++ --clean --run_tests --gtest_filter Factorial.Iteative0 --output output_Xcode_clang_clang++_Release_None
cd ../
echo 'end: test_buildAndRunTestsFilter_output_Xcode_clang_clang__Release_None'


echo 'begin: test_buildAndRunTestsFilter_output_Xcode_gcc_g__Release_None'
cd tests_benchmarks
python3 build.py --generator Xcode --profile Release --c_compiler gcc --cxx_compiler g++ --clean --run_tests --gtest_filter Factorial.Iteative0 --output output_Xcode_gcc_g++_Release_None
cd ../
echo 'end: test_buildAndRunTestsFilter_output_Xcode_gcc_g__Release_None'



echo 'begin: test_buildBenchmarkExcludeTarget_output_Unix_Makefiles_clang_clang__Debug_None'
cd tests_benchmarks
python3 build.py --generator "Unix Makefiles" --profile Debug --c_compiler clang --cxx_compiler clang++ --clean --run_benchmarks --benchmark_exclude FactorialIterativeBenchmark --output output_Unix_Makefiles_clang_clang++_Debug_None
cd ../
echo 'end: test_buildBenchmarkExcludeTarget_output_Unix_Makefiles_clang_clang__Debug_None'



echo 'begin: test_buildBenchmarkExcludeTarget_output_Unix_Makefiles_gcc_g__Debug_None'
cd tests_benchmarks
python3 build.py --generator "Unix Makefiles" --profile Debug --c_compiler gcc --cxx_compiler g++ --clean --run_benchmarks --benchmark_exclude FactorialIterativeBenchmark --output output_Unix_Makefiles_gcc_g++_Debug_None
cd ../
echo 'end: test_buildBenchmarkExcludeTarget_output_Unix_Makefiles_gcc_g__Debug_None'

echo 'begin: test_buildBenchmarkExcludeTarget_output_Xcode_clang_clang__Debug_None'
cd tests_benchmarks
python3 build.py --generator Xcode --profile Debug --c_compiler clang --cxx_compiler clang++ --clean --run_benchmarks --benchmark_exclude FactorialIterativeBenchmark --output output_Xcode_clang_clang++_Debug_None
cd ../
echo 'end: test_buildBenchmarkExcludeTarget_output_Xcode_clang_clang__Debug_None'


echo 'begin: test_buildBenchmarkExcludeTarget_output_Xcode_gcc_g__Debug_None'
cd tests_benchmarks
python3 build.py --generator Xcode --profile Debug --c_compiler gcc --cxx_compiler g++ --clean --run_benchmarks --benchmark_exclude FactorialIterativeBenchmark --output output_Xcode_gcc_g++_Debug_None
cd ../
echo 'end: test_buildBenchmarkExcludeTarget_output_Xcode_gcc_g__Debug_None'


echo 'begin: test_buildBenchmarkIncludeTarget_output_Unix_Makefiles_clang_clang__Debug_None'
cd tests_benchmarks
python3 build.py --generator "Unix Makefiles" --profile Debug --c_compiler clang --cxx_compiler clang++ --clean --run_benchmarks --benchmark_include FactorialIterativeBenchmark --output output_Unix_Makefiles_clang_clang++_Debug_None
cd ../
echo 'end: test_buildBenchmarkIncludeTarget_output_Unix_Makefiles_clang_clang__Debug_None'


echo 'begin: test_buildBenchmarkIncludeTarget_output_Xcode_clang_clang__Debug_None'
cd tests_benchmarks
python3 build.py --generator Xcode --profile Debug --c_compiler clang --cxx_compiler clang++ --clean --run_benchmarks --benchmark_include FactorialIterativeBenchmark --output output_Xcode_clang_clang++_Debug_None
cd ../
echo 'end: test_buildBenchmarkIncludeTarget_output_Xcode_clang_clang__Debug_None'



echo 'begin: test_buildBenchmarkIncludeTarget_output_Xcode_gcc_g__Debug_None'
cd tests_benchmarks
python3 build.py --generator Xcode --profile Debug --c_compiler gcc --cxx_compiler g++ --clean --run_benchmarks --benchmark_include FactorialIterativeBenchmark --output output_Xcode_gcc_g++_Debug_None
cd ../
echo 'end: test_buildBenchmarkIncludeTarget_output_Xcode_gcc_g__Debug_None'

echo 'begin: test_buildTestExcludeTarget_output_Unix_Makefiles_clang_clang__Debug_None'
cd tests_benchmarks
python3 build.py --generator "Unix Makefiles" --profile Debug --c_compiler clang --cxx_compiler clang++ --clean --run_tests --test_exclude FactorialIterativeTest --output output_Unix_Makefiles_clang_clang++_Debug_None
cd ../
echo 'end: test_buildTestExcludeTarget_output_Unix_Makefiles_clang_clang__Debug_None'


echo 'begin: test_buildTestExcludeTarget_output_Unix_Makefiles_gcc_g__Debug_None'
cd tests_benchmarks
python3 build.py --generator "Unix Makefiles" --profile Debug --c_compiler gcc --cxx_compiler g++ --clean --run_tests --test_exclude FactorialIterativeTest --output output_Unix_Makefiles_gcc_g++_Debug_None
cd ../
echo 'end: test_buildTestExcludeTarget_output_Unix_Makefiles_gcc_g__Debug_None'



echo 'begin: test_runBenchmarkOnly_output_Unix_Makefiles_clang_clang__Debug_None'
cd tests_benchmarks
python3 build.py --generator "Unix Makefiles" --profile Debug --c_compiler clang --cxx_compiler clang++ --clean --output output_Unix_Makefiles_clang_clang++_Debug_None
python3 build.py --generator "Unix Makefiles" --profile Debug --c_compiler clang --cxx_compiler clang++ --run_benchmarks_only --output output_Unix_Makefiles_clang_clang++_Debug_None
cd ../
echo 'end: test_runBenchmarkOnly_output_Unix_Makefiles_clang_clang__Debug_None'



echo 'begin: test_runTestsOnly_output_Unix_Makefiles_clang_clang__Debug_None'
cd tests_benchmarks
python3 build.py --generator "Unix Makefiles" --profile Debug --c_compiler clang --cxx_compiler clang++ --clean --output output_Unix_Makefiles_clang_clang++_Debug_None
python3 build.py --generator "Unix Makefiles" --profile Debug --c_compiler clang --cxx_compiler clang++ --run_tests_only --output output_Unix_Makefiles_clang_clang++_Debug_None
cd ../
echo 'end: test_runTestsOnly_output_Unix_Makefiles_clang_clang__Debug_None'



echo 'begin: test_definePass_output_Eclipse_CDT4___Ninja_clang_clang__Debug_None'
cd single_exec
python3 build.py --generator "Eclipse CDT4 - Ninja" --profile Debug --c_compiler clang --cxx_compiler clang++ --clean --c_definitions THIS_IS_DEFINE THIS_IS_DEFINE_VALUE=1 --output output_Eclipse_CDT4_-_Ninja_clang_clang++_Debug_None
cd ../
echo 'end: test_definePass_output_Eclipse_CDT4___Ninja_clang_clang__Debug_None'




echo 'begin: test_definePass_output_Eclipse_CDT4___Ninja_clang_clang__Debug_None'
cd single_exec
python3 build.py --generator "Eclipse CDT4 - Ninja" --profile Debug --c_compiler gcc --cxx_compiler g++ --clean --c_definitions THIS_IS_DEFINE THIS_IS_DEFINE_VALUE=1 --output output_Eclipse_CDT4_-_Ninja_gcc_g++_Debug_None
cd ../
echo 'end: test_definePass_output_Eclipse_CDT4___Ninja_clang_clang__Debug_None'



echo 'begin: test_definePass_output_Ninja_clang_clang__Debug_None'
cd single_exec
python3 build.py --generator Ninja --profile Debug --c_compiler clang --cxx_compiler clang++ --clean --c_definitions THIS_IS_DEFINE THIS_IS_DEFINE_VALUE=1 --output output_Ninja_clang_clang++_Debug_None
cd ../
echo 'end: test_definePass_output_Ninja_clang_clang__Debug_None'

echo 'begin: test_definePass_output_Ninja_gcc_g__Debug_None'
cd single_exec
python3 build.py --generator Ninja --profile Debug --c_compiler gcc --cxx_compiler g++ --clean --c_definitions THIS_IS_DEFINE THIS_IS_DEFINE_VALUE=1 --output output_Ninja_gcc_g++_Debug_None
cd ../
echo 'end: test_definePass_output_Ninja_gcc_g__Debug_None'


echo 'begin: test_definePass_output_Unix_Makefiles_clang_clang__Debug_None'
cd single_exec
python3 build.py --generator "Unix Makefiles" --profile Debug --c_compiler clang --cxx_compiler clang++ --clean --c_definitions THIS_IS_DEFINE THIS_IS_DEFINE_VALUE=1 --output output_Unix_Makefiles_clang_clang++_Debug_None
cd ../
echo 'end: test_definePass_output_Unix_Makefiles_clang_clang__Debug_None'


echo 'begin: test_definePass_output_Unix_Makefiles_gcc_g__Debug_None'
cd single_exec
python3 build.py --generator "Unix Makefiles" --profile Debug --c_compiler gcc --cxx_compiler g++ --clean --c_definitions THIS_IS_DEFINE THIS_IS_DEFINE_VALUE=1 --output output_Unix_Makefiles_gcc_g++_Debug_None
cd ../
echo 'end: test_definePass_output_Unix_Makefiles_gcc_g__Debug_None'



echo 'begin: test_definePass_output_Xcode_clang_clang__Debug_None'
cd single_exec
python3 build.py --generator Xcode --profile Debug --c_compiler clang --cxx_compiler clang++ --clean --c_definitions THIS_IS_DEFINE THIS_IS_DEFINE_VALUE=1 --output output_Xcode_clang_clang++_Debug_None
cd ../
echo 'end: test_definePass_output_Xcode_clang_clang__Debug_None'



echo 'begin: test_definePass_output_Xcode_gcc_g__Debug_None'
cd single_exec
python3 build.py --generator Xcode --profile Debug --c_compiler gcc --cxx_compiler g++ --clean --c_definitions THIS_IS_DEFINE THIS_IS_DEFINE_VALUE=1 --output output_Xcode_gcc_g++_Debug_None
cd ../
echo 'end: test_definePass_output_Xcode_gcc_g__Debug_None'

echo 'begin: test_generateOnly_output_Eclipse_CDT4___Ninja_clang_clang__Debug_None'
cd single_exec
python3 build.py --generator "Eclipse CDT4 - Ninja" --profile Debug --c_compiler clang --cxx_compiler clang++ --clean --generate_only --output output_Eclipse_CDT4_-_Ninja_clang_clang++_Debug_None
cd ../
echo 'end: test_generateOnly_output_Eclipse_CDT4___Ninja_clang_clang__Debug_None'



echo 'begin: test_customOutput'
cd cmake_defines
python3 build.py --cmake_definitions THIS_IS_CMAKE_DEFINE=1 THIS_IS_ANOTHER_CMAKE_DEFINE=abc
cd ../
echo 'end: test_customOutput'



echo 'begin: test_generatorsCompilerProfilesStandards_output_Eclipse_CDT4___Ninja_clang_clang__Debug_11'
cd compiler_profile
python3 build.py --generator "Eclipse CDT4 - Ninja" --profile Debug --c_compiler clang --cxx_compiler clang++ --cpp_standard 11 --clean --clean --output output_Eclipse_CDT4_-_Ninja_clang_clang++_Debug_11
cd ../
echo 'end: test_generatorsCompilerProfilesStandards_output_Eclipse_CDT4___Ninja_clang_clang__Debug_11'




echo 'begin: test_generatorsCompilerProfilesStandards_output_Eclipse_CDT4___Ninja_clang_clang__Debug_14'
cd compiler_profile
python3 build.py --generator "Eclipse CDT4 - Ninja" --profile Debug --c_compiler clang --cxx_compiler clang++ --cpp_standard 14 --clean --clean --output output_Eclipse_CDT4_-_Ninja_clang_clang++_Debug_14
cd ../
echo 'end: test_generatorsCompilerProfilesStandards_output_Eclipse_CDT4___Ninja_clang_clang__Debug_14'




echo 'begin: test_generatorsCompilerProfilesStandards_output_Eclipse_CDT4___Ninja_clang_clang__Debug_17'
cd compiler_profile
python3 build.py --generator "Eclipse CDT4 - Ninja" --profile Debug --c_compiler clang --cxx_compiler clang++ --cpp_standard 17 --clean --clean --output output_Eclipse_CDT4_-_Ninja_clang_clang++_Debug_17
cd ../
echo 'end: test_generatorsCompilerProfilesStandards_output_Eclipse_CDT4___Ninja_clang_clang__Debug_17'



echo 'begin: test_generatorsCompilerProfilesStandards_output_Eclipse_CDT4___Ninja_clang_clang__Debug_20'
cd compiler_profile
python3 build.py --generator "Eclipse CDT4 - Ninja" --profile Debug --c_compiler clang --cxx_compiler clang++ --cpp_standard 20 --clean --clean --output output_Eclipse_CDT4_-_Ninja_clang_clang++_Debug_20
cd ../
echo 'end: test_generatorsCompilerProfilesStandards_output_Eclipse_CDT4___Ninja_clang_clang__Debug_20'


echo 'begin: test_generatorsCompilerProfilesStandards_output_Eclipse_CDT4___Ninja_gcc_g__Debug_11'
cd compiler_profile
python3 build.py --generator "Eclipse CDT4 - Ninja" --profile Debug --c_compiler gcc --cxx_compiler g++ --cpp_standard 11 --clean --clean --output output_Eclipse_CDT4_-_Ninja_gcc_g++_Debug_11
cd ../
echo 'end: test_generatorsCompilerProfilesStandards_output_Eclipse_CDT4___Ninja_gcc_g__Debug_11'

echo 'begin: test_generatorsCompilerProfilesStandards_output_Eclipse_CDT4___Ninja_gcc_g__Debug_14'
cd compiler_profile
python3 build.py --generator "Eclipse CDT4 - Ninja" --profile Debug --c_compiler gcc --cxx_compiler g++ --cpp_standard 14 --clean --clean --output output_Eclipse_CDT4_-_Ninja_gcc_g++_Debug_14
cd ../
echo 'end: test_generatorsCompilerProfilesStandards_output_Eclipse_CDT4___Ninja_gcc_g__Debug_14'

echo 'begin: test_generatorsCompilerProfilesStandards_output_Eclipse_CDT4___Ninja_gcc_g__Debug_17'
cd compiler_profile
python3 build.py --generator "Eclipse CDT4 - Ninja" --profile Debug --c_compiler gcc --cxx_compiler g++ --cpp_standard 17 --clean --clean --output output_Eclipse_CDT4_-_Ninja_gcc_g++_Debug_17
cd ../
echo 'end: test_generatorsCompilerProfilesStandards_output_Eclipse_CDT4___Ninja_gcc_g__Debug_17'

echo 'begin: test_generatorsCompilerProfilesStandards_output_Eclipse_CDT4___Ninja_gcc_g__Debug_20'
cd compiler_profile
python3 build.py --generator "Eclipse CDT4 - Ninja" --profile Debug --c_compiler gcc --cxx_compiler g++ --cpp_standard 20 --clean --clean --output output_Eclipse_CDT4_-_Ninja_gcc_g++_Debug_20
cd ../
echo 'end: test_generatorsCompilerProfilesStandards_output_Eclipse_CDT4___Ninja_gcc_g__Debug_20'






echo 'begin: test_generatorsCompilerProfilesStandards_output_Ninja_clang_clang__Debug_98'
cd compiler_profile
python3 build.py --generator Ninja --profile Debug --c_compiler clang --cxx_compiler clang++ --cpp_standard 98 --clean --clean --output output_Ninja_clang_clang++_Debug_98
cd ../
echo 'end: test_generatorsCompilerProfilesStandards_output_Ninja_clang_clang__Debug_98'

echo 'begin: test_generatorsCompilerProfilesStandards_output_Ninja_clang_clang__Debug_11'
cd compiler_profile
python3 build.py --generator Ninja --profile Debug --c_compiler clang --cxx_compiler clang++ --cpp_standard 11 --clean --clean --output output_Ninja_clang_clang++_Debug_11
cd ../
echo 'end: test_generatorsCompilerProfilesStandards_output_Ninja_clang_clang__Debug_11'

echo 'begin: test_generatorsCompilerProfilesStandards_output_Ninja_clang_clang__Debug_14'
cd compiler_profile
python3 build.py --generator Ninja --profile Debug --c_compiler clang --cxx_compiler clang++ --cpp_standard 14 --clean --clean --output output_Ninja_clang_clang++_Debug_14
cd ../
echo 'end: test_generatorsCompilerProfilesStandards_output_Ninja_clang_clang__Debug_14'

echo 'begin: test_generatorsCompilerProfilesStandards_output_Ninja_clang_clang__Debug_17'
cd compiler_profile
python3 build.py --generator Ninja --profile Debug --c_compiler clang --cxx_compiler clang++ --cpp_standard 17 --clean --clean --output output_Ninja_clang_clang++_Debug_17
cd ../
echo 'end: test_generatorsCompilerProfilesStandards_output_Ninja_clang_clang__Debug_17'

echo 'begin: test_generatorsCompilerProfilesStandards_output_Ninja_clang_clang__Debug_20'
cd compiler_profile
python3 build.py --generator Ninja --profile Debug --c_compiler clang --cxx_compiler clang++ --cpp_standard 20 --clean --clean --output output_Ninja_clang_clang++_Debug_20
cd ../
echo 'end: test_generatorsCompilerProfilesStandards_output_Ninja_clang_clang__Debug_20'






echo 'begin: test_generatorsCompilerProfilesStandards_output_Ninja_gcc_g__Debug_11'
cd compiler_profile
python3 build.py --generator Ninja --profile Debug --c_compiler gcc --cxx_compiler g++ --cpp_standard 11 --clean --clean --output output_Ninja_gcc_g++_Debug_11
cd ../
echo 'end: test_generatorsCompilerProfilesStandards_output_Ninja_gcc_g__Debug_11'

echo 'begin: test_generatorsCompilerProfilesStandards_output_Ninja_gcc_g__Debug_14'
cd compiler_profile
python3 build.py --generator Ninja --profile Debug --c_compiler gcc --cxx_compiler g++ --cpp_standard 14 --clean --clean --output output_Ninja_gcc_g++_Debug_14
cd ../
echo 'end: test_generatorsCompilerProfilesStandards_output_Ninja_gcc_g__Debug_14'

echo 'begin: test_generatorsCompilerProfilesStandards_output_Ninja_gcc_g__Debug_17'
cd compiler_profile
python3 build.py --generator Ninja --profile Debug --c_compiler gcc --cxx_compiler g++ --cpp_standard 17 --clean --clean --output output_Ninja_gcc_g++_Debug_17
cd ../
echo 'end: test_generatorsCompilerProfilesStandards_output_Ninja_gcc_g__Debug_17'

echo 'begin: test_generatorsCompilerProfilesStandards_output_Ninja_gcc_g__Debug_20'
cd compiler_profile
python3 build.py --generator Ninja --profile Debug --c_compiler gcc --cxx_compiler g++ --cpp_standard 20 --clean --clean --output output_Ninja_gcc_g++_Debug_20
cd ../
echo 'end: test_generatorsCompilerProfilesStandards_output_Ninja_gcc_g__Debug_20'



echo 'begin: test_generatorsCompilerProfilesStandards_output_Unix_Makefiles_clang_clang__Debug_11'
cd compiler_profile
python3 build.py --generator "Unix Makefiles" --profile Debug --c_compiler clang --cxx_compiler clang++ --cpp_standard 11 --clean --clean --output output_Unix_Makefiles_clang_clang++_Debug_11
cd ../
echo 'end: test_generatorsCompilerProfilesStandards_output_Unix_Makefiles_clang_clang__Debug_11'


echo 'begin: test_generatorsCompilerProfilesStandards_output_Unix_Makefiles_clang_clang__Debug_14'
cd compiler_profile
python3 build.py --generator "Unix Makefiles" --profile Debug --c_compiler clang --cxx_compiler clang++ --cpp_standard 14 --clean --clean --output output_Unix_Makefiles_clang_clang++_Debug_14
cd ../
echo 'end: test_generatorsCompilerProfilesStandards_output_Unix_Makefiles_clang_clang__Debug_14'

echo 'begin: test_generatorsCompilerProfilesStandards_output_Unix_Makefiles_clang_clang__Debug_17'
cd compiler_profile
python3 build.py --generator "Unix Makefiles" --profile Debug --c_compiler clang --cxx_compiler clang++ --cpp_standard 17 --clean --clean --output output_Unix_Makefiles_clang_clang++_Debug_17
cd ../
echo 'end: test_generatorsCompilerProfilesStandards_output_Unix_Makefiles_clang_clang__Debug_17'

echo 'begin: test_generatorsCompilerProfilesStandards_output_Unix_Makefiles_clang_clang__Debug_20'
cd compiler_profile
python3 build.py --generator "Unix Makefiles" --profile Debug --c_compiler clang --cxx_compiler clang++ --cpp_standard 20 --clean --clean --output output_Unix_Makefiles_clang_clang++_Debug_20
cd ../
echo 'end: test_generatorsCompilerProfilesStandards_output_Unix_Makefiles_clang_clang__Debug_20'





echo 'begin: test_generatorsCompilerProfilesStandards_output_Unix_Makefiles_gcc_g__Debug_11'
cd compiler_profile
python3 build.py --generator "Unix Makefiles" --profile Debug --c_compiler gcc --cxx_compiler g++ --cpp_standard 11 --clean --clean --output output_Unix_Makefiles_gcc_g++_Debug_11
cd ../
echo 'end: test_generatorsCompilerProfilesStandards_output_Unix_Makefiles_gcc_g__Debug_11'

echo 'begin: test_generatorsCompilerProfilesStandards_output_Unix_Makefiles_gcc_g__Debug_14'
cd compiler_profile
python3 build.py --generator "Unix Makefiles" --profile Debug --c_compiler gcc --cxx_compiler g++ --cpp_standard 14 --clean --clean --output output_Unix_Makefiles_gcc_g++_Debug_14
cd ../
echo 'end: test_generatorsCompilerProfilesStandards_output_Unix_Makefiles_gcc_g__Debug_14'

echo 'begin: test_generatorsCompilerProfilesStandards_output_Unix_Makefiles_gcc_g__Debug_17'
cd compiler_profile
python3 build.py --generator "Unix Makefiles" --profile Debug --c_compiler gcc --cxx_compiler g++ --cpp_standard 17 --clean --clean --output output_Unix_Makefiles_gcc_g++_Debug_17
cd ../
echo 'end: test_generatorsCompilerProfilesStandards_output_Unix_Makefiles_gcc_g__Debug_17'

echo 'begin: test_generatorsCompilerProfilesStandards_output_Unix_Makefiles_gcc_g__Debug_20'
cd compiler_profile
python3 build.py --generator "Unix Makefiles" --profile Debug --c_compiler gcc --cxx_compiler g++ --cpp_standard 20 --clean --clean --output output_Unix_Makefiles_gcc_g++_Debug_20
cd ../
echo 'end: test_generatorsCompilerProfilesStandards_output_Unix_Makefiles_gcc_g__Debug_20'





echo 'begin: test_generatorsCompilerProfilesStandards_output_Xcode_clang_clang__Debug_11'
cd compiler_profile
python3 build.py --generator Xcode --profile Debug --c_compiler clang --cxx_compiler clang++ --cpp_standard 11 --clean --clean --output output_Xcode_clang_clang++_Debug_11
cd ../
echo 'end: test_generatorsCompilerProfilesStandards_output_Xcode_clang_clang__Debug_11'

echo 'begin: test_generatorsCompilerProfilesStandards_output_Xcode_clang_clang__Debug_14'
cd compiler_profile
python3 build.py --generator Xcode --profile Debug --c_compiler clang --cxx_compiler clang++ --cpp_standard 14 --clean --clean --output output_Xcode_clang_clang++_Debug_14
cd ../
echo 'end: test_generatorsCompilerProfilesStandards_output_Xcode_clang_clang__Debug_14'

echo 'begin: test_generatorsCompilerProfilesStandards_output_Xcode_clang_clang__Debug_17'
cd compiler_profile
python3 build.py --generator Xcode --profile Debug --c_compiler clang --cxx_compiler clang++ --cpp_standard 17 --clean --clean --output output_Xcode_clang_clang++_Debug_17
cd ../
echo 'end: test_generatorsCompilerProfilesStandards_output_Xcode_clang_clang__Debug_17'

echo 'begin: test_generatorsCompilerProfilesStandards_output_Xcode_clang_clang__Debug_20'
cd compiler_profile
python3 build.py --generator Xcode --profile Debug --c_compiler clang --cxx_compiler clang++ --cpp_standard 14 --clean --clean --output output_Xcode_clang_clang++_Debug_20
cd ../
echo 'end: test_generatorsCompilerProfilesStandards_output_Xcode_clang_clang__Debug_20'







echo 'begin: test_generatorsCompilerProfilesStandards_output_Xcode_gcc_g__Debug_11'
cd compiler_profile
python3 build.py --generator Xcode --profile Debug --c_compiler gcc --cxx_compiler g++ --cpp_standard 11 --clean --clean --output output_Xcode_gcc_g++_Debug_11
cd ../
echo 'end: test_generatorsCompilerProfilesStandards_output_Xcode_gcc_g__Debug_11'

echo 'begin: test_generatorsCompilerProfilesStandards_output_Xcode_gcc_g__Debug_14'
cd compiler_profile
python3 build.py --generator Xcode --profile Debug --c_compiler gcc --cxx_compiler g++ --cpp_standard 14 --clean --clean --output output_Xcode_gcc_g++_Debug_14
cd ../
echo 'end: test_generatorsCompilerProfilesStandards_output_Xcode_gcc_g__Debug_14'

echo 'begin: test_generatorsCompilerProfilesStandards_output_Xcode_gcc_g__Debug_17'
cd compiler_profile
python3 build.py --generator Xcode --profile Debug --c_compiler gcc --cxx_compiler g++ --cpp_standard 17 --clean --clean --output output_Xcode_gcc_g++_Debug_17
cd ../
echo 'end: test_generatorsCompilerProfilesStandards_output_Xcode_gcc_g__Debug_17'

echo 'begin: test_generatorsCompilerProfilesStandards_output_Xcode_gcc_g__Debug_20'
cd compiler_profile
python3 build.py --generator Xcode --profile Debug --c_compiler gcc --cxx_compiler g++ --cpp_standard 20 --clean --clean --output output_Xcode_gcc_g++_Debug_20
cd ../
echo 'end: test_generatorsCompilerProfilesStandards_output_Xcode_gcc_g__Debug_20'







echo 'begin: test_doxygen'
cd multi_targets_project
python3 build.py -dox_only --doxygen_configuration Doxyfile_config
cd ../
echo 'end: test_doxygen'




echo 'begin: test_buildWithResources_output_Xcode_clang_clang__Release_None'
cd multi_targets_project
python3 build.py --generator Xcode --profile Release --c_compiler clang --cxx_compiler clang++ --clean --output output_Xcode_clang_clang++_Release_None
cd ../
echo 'end: test_buildWithResources_output_Xcode_clang_clang__Release_None'

