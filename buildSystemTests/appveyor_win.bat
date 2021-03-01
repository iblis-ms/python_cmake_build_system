
xcopy  ..\build tests_benchmarks\build /E /I /C /Y
xcopy  ..\build.py tests_benchmarks  /C /Y

xcopy  ..\build compiler_profile\build /E /I /C /Y
xcopy  ..\build.py compiler_profile  /C /Y

xcopy  ..\build multi_targets_project\build /E /I /C /Y
xcopy  ..\build.py multi_targets_project  /C /Y

xcopy  ..\build sanitizers_issues\build /E /I /C /Y
xcopy  ..\build.py sanitizers_issues  /C /Y

xcopy  ..\build single_exec\build /E /I /C /Y
xcopy  ..\build.py single_exec  /C /Y


xcopy  ..\build tests_benchmarks\build /E /I /C /Y
xcopy  ..\build.py tests_benchmarks  /C /Y





echo 'begin: test_buildAndRunBenchmarksFilter_output_Eclipse_CDT4___MinGW_Makefiles_gcc_g__Debug_None'
cd tests_benchmarks
py -3 build.py --generator "Eclipse CDT4 - MinGW Makefiles" --profile Debug --c_compiler gcc --cxx_compiler g++ --clean --run_benchmarks --benchmark_filter Benchmark_factorial_iterative --output output_Eclipse_CDT4_-_MinGW_Makefiles_gcc_g++_Debug_None
cd ..
echo 'end: test_buildAndRunBenchmarksFilter_output_Eclipse_CDT4___MinGW_Makefiles_gcc_g__Debug_None'


echo 'begin: test_buildAndRunBenchmarksFilter_output_Eclipse_CDT4___MinGW_Makefiles_gcc_g__Release_None'
cd tests_benchmarks
py -3 build.py --generator "Eclipse CDT4 - MinGW Makefiles" --profile Release --c_compiler gcc --cxx_compiler g++ --clean --run_benchmarks --benchmark_filter Benchmark_factorial_iterative --output output_Eclipse_CDT4_-_MinGW_Makefiles_gcc_g++_Release_None
cd ..
echo 'end: test_buildAndRunBenchmarksFilter_output_Eclipse_CDT4___MinGW_Makefiles_gcc_g__Release_None'

echo 'begin: test_buildAndRunBenchmarksFilter_output_MinGW_Makefiles_gcc_g__Debug_None'
cd tests_benchmarks
py -3 build.py --generator "MinGW Makefiles" --profile Debug --c_compiler gcc --cxx_compiler g++ --clean --run_benchmarks --benchmark_filter Benchmark_factorial_iterative --output output_MinGW_Makefiles_gcc_g++_Debug_None
cd ..
echo 'end: test_buildAndRunBenchmarksFilter_output_MinGW_Makefiles_gcc_g__Debug_None'

echo 'begin: test_buildAndRunBenchmarksFilter_output_MinGW_Makefiles_gcc_g__Release_None'
cd tests_benchmarks
py -3 build.py --generator "MinGW Makefiles" --profile Release --c_compiler gcc --cxx_compiler g++ --clean --run_benchmarks --benchmark_filter Benchmark_factorial_iterative --output output_MinGW_Makefiles_gcc_g++_Release_None
cd ..
echo 'end: test_buildAndRunBenchmarksFilter_output_MinGW_Makefiles_gcc_g__Release_None'






echo 'begin: test_buildAndRunBenchmarksFilter_output_Visual_Studio_16_2019_cl_cl_Debug_None'
cd tests_benchmarks
py -3 build.py --generator "Visual Studio 16 2019" --profile Debug --c_compiler cl --cxx_compiler cl --clean --run_benchmarks --benchmark_filter Benchmark_factorial_iterative --output output_Visual_Studio_16_2019_cl_cl_Debug_None
cd ..
echo 'end: test_buildAndRunBenchmarksFilter_output_Visual_Studio_16_2019_cl_cl_Debug_None'








echo 'begin: test_buildAndRunBenchmarksFilter_output_Visual_Studio_16_2019_cl_cl_Release_None'
cd tests_benchmarks
py -3 build.py --generator "Visual Studio 16 2019" --profile Release --c_compiler cl --cxx_compiler cl --clean --run_benchmarks --benchmark_filter Benchmark_factorial_iterative --output output_Visual_Studio_16_2019_cl_cl_Release_None
cd ..
echo 'end: test_buildAndRunBenchmarksFilter_output_Visual_Studio_16_2019_cl_cl_Release_None'





echo 'begin: test_buildAndRunBenchmarks_output_Eclipse_CDT4___MinGW_Makefiles_gcc_g__Debug_None'
cd tests_benchmarks
py -3 build.py --generator "Eclipse CDT4 - MinGW Makefiles" --profile Debug --c_compiler gcc --cxx_compiler g++ --clean --run_benchmarks --output output_Eclipse_CDT4_-_MinGW_Makefiles_gcc_g++_Debug_None
cd ..
echo 'end: test_buildAndRunBenchmarks_output_Eclipse_CDT4___MinGW_Makefiles_gcc_g__Debug_None'





echo 'begin: test_buildAndRunBenchmarks_output_Eclipse_CDT4___MinGW_Makefiles_gcc_g__Release_None'
cd tests_benchmarks
py -3 build.py --generator "Eclipse CDT4 - MinGW Makefiles" --profile Release --c_compiler gcc --cxx_compiler g++ --clean --run_benchmarks --output output_Eclipse_CDT4_-_MinGW_Makefiles_gcc_g++_Release_None
cd ..
echo 'end: test_buildAndRunBenchmarks_output_Eclipse_CDT4___MinGW_Makefiles_gcc_g__Release_None'





echo 'begin: test_buildAndRunBenchmarks_output_MinGW_Makefiles_gcc_g__Debug_None'
cd tests_benchmarks
py -3 build.py --generator "MinGW Makefiles" --profile Debug --c_compiler gcc --cxx_compiler g++ --clean --run_benchmarks --output output_MinGW_Makefiles_gcc_g++_Debug_None
cd ..
echo 'end: test_buildAndRunBenchmarks_output_MinGW_Makefiles_gcc_g__Debug_None'










echo 'begin: test_buildAndRunBenchmarks_output_MinGW_Makefiles_gcc_g__Release_None'
cd tests_benchmarks
py -3 build.py --generator "MinGW Makefiles" --profile Release --c_compiler gcc --cxx_compiler g++ --clean --run_benchmarks --output output_MinGW_Makefiles_gcc_g++_Release_None
cd ..
echo 'end: test_buildAndRunBenchmarks_output_MinGW_Makefiles_gcc_g__Release_None'


echo 'begin: test_buildAndRunBenchmarks_output_Visual_Studio_16_2019_cl_cl_Debug_None'
cd tests_benchmarks
py -3 build.py --generator "Visual Studio 16 2019" --profile Debug --c_compiler cl --cxx_compiler cl --clean --run_benchmarks --output output_Visual_Studio_16_2019_cl_cl_Debug_None
cd ..
echo 'end: test_buildAndRunBenchmarks_output_Visual_Studio_16_2019_cl_cl_Debug_None'



echo 'begin: test_buildAndRunBenchmarks_output_Visual_Studio_16_2019_cl_cl_Release_None'
cd tests_benchmarks
py -3 build.py --generator "Visual Studio 16 2019" --profile Release --c_compiler cl --cxx_compiler cl --clean --run_benchmarks --output output_Visual_Studio_16_2019_cl_cl_Release_None
cd ..
echo 'end: test_buildAndRunBenchmarks_output_Visual_Studio_16_2019_cl_cl_Release_None'




echo 'begin: test_buildAndRunTestsBenchmarks_output_Eclipse_CDT4___MinGW_Makefiles_gcc_g__Debug_None'
cd tests_benchmarks
py -3 build.py --generator "Eclipse CDT4 - MinGW Makefiles" --profile Debug --c_compiler gcc --cxx_compiler g++ --clean --run_tests --run_benchmarks --output output_Eclipse_CDT4_-_MinGW_Makefiles_gcc_g++_Debug_None
cd ..
echo 'end: test_buildAndRunTestsBenchmarks_output_Eclipse_CDT4___MinGW_Makefiles_gcc_g__Debug_None'



echo 'begin: test_buildAndRunTestsBenchmarks_output_Eclipse_CDT4___MinGW_Makefiles_gcc_g__Release_None'
cd tests_benchmarks
py -3 build.py --generator "Eclipse CDT4 - MinGW Makefiles" --profile Release --c_compiler gcc --cxx_compiler g++ --clean --run_tests --run_benchmarks --output output_Eclipse_CDT4_-_MinGW_Makefiles_gcc_g++_Release_None
cd ..
echo 'end: test_buildAndRunTestsBenchmarks_output_Eclipse_CDT4___MinGW_Makefiles_gcc_g__Release_None'





echo 'begin: test_buildAndRunTestsBenchmarks_output_MinGW_Makefiles_gcc_g__Debug_None'
cd tests_benchmarks
py -3 build.py --generator "MinGW Makefiles" --profile Debug --c_compiler gcc --cxx_compiler g++ --clean --run_tests --run_benchmarks --output output_MinGW_Makefiles_gcc_g++_Debug_None
cd ..
echo 'end: test_buildAndRunTestsBenchmarks_output_MinGW_Makefiles_gcc_g__Debug_None'


echo 'begin: test_buildAndRunTestsBenchmarks_output_MinGW_Makefiles_gcc_g__Release_None'
cd tests_benchmarks
py -3 build.py --generator "MinGW Makefiles" --profile Release --c_compiler gcc --cxx_compiler g++ --clean --run_tests --run_benchmarks --output output_MinGW_Makefiles_gcc_g++_Release_None
cd ..
echo 'end: test_buildAndRunTestsBenchmarks_output_MinGW_Makefiles_gcc_g__Release_None'





echo 'begin: test_buildAndRunTestsBenchmarks_output_Visual_Studio_16_2019_cl_cl_Debug_None'
cd tests_benchmarks
py -3 build.py --generator "Visual Studio 16 2019" --profile Debug --c_compiler cl --cxx_compiler cl --clean --run_tests --run_benchmarks --output output_Visual_Studio_16_2019_cl_cl_Debug_None
cd ..
echo 'end: test_buildAndRunTestsBenchmarks_output_Visual_Studio_16_2019_cl_cl_Debug_None'



echo 'begin: test_buildAndRunTestsBenchmarks_output_Visual_Studio_16_2019_cl_cl_Release_None'
cd tests_benchmarks
py -3 build.py --generator "Visual Studio 16 2019" --profile Release --c_compiler cl --cxx_compiler cl --clean --run_tests --run_benchmarks --output output_Visual_Studio_16_2019_cl_cl_Release_None
cd ..
echo 'end: test_buildAndRunTestsBenchmarks_output_Visual_Studio_16_2019_cl_cl_Release_None'






echo 'begin: test_buildAndRunTestsFilter_output_Eclipse_CDT4___MinGW_Makefiles_gcc_g__Debug_None'
cd tests_benchmarks
py -3 build.py --generator "Eclipse CDT4 - MinGW Makefiles" --profile Debug --c_compiler gcc --cxx_compiler g++ --clean --run_tests --gtest_filter Factorial.Iteative0 --output output_Eclipse_CDT4_-_MinGW_Makefiles_gcc_g++_Debug_None
cd ..
echo 'end: test_buildAndRunTestsFilter_output_Eclipse_CDT4___MinGW_Makefiles_gcc_g__Debug_None'




echo 'begin: test_buildAndRunTestsFilter_output_Eclipse_CDT4___MinGW_Makefiles_gcc_g__Release_None'
cd tests_benchmarks
py -3 build.py --generator "Eclipse CDT4 - MinGW Makefiles" --profile Release --c_compiler gcc --cxx_compiler g++ --clean --run_tests --gtest_filter Factorial.Iteative0 --output output_Eclipse_CDT4_-_MinGW_Makefiles_gcc_g++_Release_None
cd ..
echo 'end: test_buildAndRunTestsFilter_output_Eclipse_CDT4___MinGW_Makefiles_gcc_g__Release_None'



echo 'begin: test_buildAndRunTestsFilter_output_MinGW_Makefiles_gcc_g__Debug_None'
cd tests_benchmarks
py -3 build.py --generator "MinGW Makefiles" --profile Debug --c_compiler gcc --cxx_compiler g++ --clean --run_tests --gtest_filter Factorial.Iteative0 --output output_MinGW_Makefiles_gcc_g++_Debug_None
cd ..
echo 'end: test_buildAndRunTestsFilter_output_MinGW_Makefiles_gcc_g__Debug_None'


echo 'begin: test_buildAndRunTestsFilter_output_MinGW_Makefiles_gcc_g__Release_None'
cd tests_benchmarks
py -3 build.py --generator "MinGW Makefiles" --profile Release --c_compiler gcc --cxx_compiler g++ --clean --run_tests --gtest_filter Factorial.Iteative0 --output output_MinGW_Makefiles_gcc_g++_Release_None
cd ..
echo 'end: test_buildAndRunTestsFilter_output_MinGW_Makefiles_gcc_g__Release_None'



echo 'begin: test_buildAndRunTestsFilter_output_Visual_Studio_16_2019_cl_cl_Debug_None'
cd tests_benchmarks
py -3 build.py --generator "Visual Studio 16 2019" --profile Debug --c_compiler cl --cxx_compiler cl --clean --run_tests --gtest_filter Factorial.Iteative0 --output output_Visual_Studio_16_2019_cl_cl_Debug_None
cd ..
echo 'end: test_buildAndRunTestsFilter_output_Visual_Studio_16_2019_cl_cl_Debug_None'





echo 'begin: test_buildAndRunTestsFilter_output_Visual_Studio_16_2019_cl_cl_Release_None'
cd tests_benchmarks
py -3 build.py --generator "Visual Studio 16 2019" --profile Release --c_compiler cl --cxx_compiler cl --clean --run_tests --gtest_filter Factorial.Iteative0 --output output_Visual_Studio_16_2019_cl_cl_Release_None
cd ..
echo 'end: test_buildAndRunTestsFilter_output_Visual_Studio_16_2019_cl_cl_Release_None'


echo 'begin: test_buildAndRunTests_output_Eclipse_CDT4___MinGW_Makefiles_gcc_g__Debug_None'
cd tests_benchmarks
py -3 build.py --generator "Eclipse CDT4 - MinGW Makefiles" --profile Debug --c_compiler gcc --cxx_compiler g++ --clean --run_tests --output output_Eclipse_CDT4_-_MinGW_Makefiles_gcc_g++_Debug_None
cd ..
echo 'end: test_buildAndRunTests_output_Eclipse_CDT4___MinGW_Makefiles_gcc_g__Debug_None'




echo 'begin: test_buildAndRunTests_output_Eclipse_CDT4___MinGW_Makefiles_gcc_g__Release_None'
cd tests_benchmarks
py -3 build.py --generator "Eclipse CDT4 - MinGW Makefiles" --profile Release --c_compiler gcc --cxx_compiler g++ --clean --run_tests --output output_Eclipse_CDT4_-_MinGW_Makefiles_gcc_g++_Release_None
cd ..
echo 'end: test_buildAndRunTests_output_Eclipse_CDT4___MinGW_Makefiles_gcc_g__Release_None'



echo 'begin: test_buildAndRunTests_output_MinGW_Makefiles_gcc_g__Debug_None'
cd tests_benchmarks
py -3 build.py --generator "MinGW Makefiles" --profile Debug --c_compiler gcc --cxx_compiler g++ --clean --run_tests --output output_MinGW_Makefiles_gcc_g++_Debug_None
cd ..
echo 'end: test_buildAndRunTests_output_MinGW_Makefiles_gcc_g__Debug_None'




echo 'begin: test_buildAndRunTests_output_MinGW_Makefiles_gcc_g__Release_None'
cd tests_benchmarks
py -3 build.py --generator "MinGW Makefiles" --profile Release --c_compiler gcc --cxx_compiler g++ --clean --run_tests --output output_MinGW_Makefiles_gcc_g++_Release_None
cd ..
echo 'end: test_buildAndRunTests_output_MinGW_Makefiles_gcc_g__Release_None'





echo 'begin: test_buildAndRunTests_output_Visual_Studio_16_2019_cl_cl_Debug_None'
cd tests_benchmarks
py -3 build.py --generator "Visual Studio 16 2019" --profile Debug --c_compiler cl --cxx_compiler cl --clean --run_tests --output output_Visual_Studio_16_2019_cl_cl_Debug_None
cd ..
echo 'end: test_buildAndRunTests_output_Visual_Studio_16_2019_cl_cl_Debug_None'





echo 'begin: test_buildAndRunTests_output_Visual_Studio_16_2019_cl_cl_Release_None'
cd tests_benchmarks
py -3 build.py --generator "Visual Studio 16 2019" --profile Release --c_compiler cl --cxx_compiler cl --clean --run_tests --output output_Visual_Studio_16_2019_cl_cl_Release_None
cd ..
echo 'end: test_buildAndRunTests_output_Visual_Studio_16_2019_cl_cl_Release_None'



echo 'begin: test_buildBenchmarkExcludeTarget_output_Eclipse_CDT4___MinGW_Makefiles_gcc_g__Debug_None'
cd tests_benchmarks
py -3 build.py --generator "Eclipse CDT4 - MinGW Makefiles" --profile Debug --c_compiler gcc --cxx_compiler g++ --clean --run_benchmarks --benchmark_exclude FactorialIterativeBenchmark --output output_Eclipse_CDT4_-_MinGW_Makefiles_gcc_g++_Debug_None
cd ..
echo 'end: test_buildBenchmarkExcludeTarget_output_Eclipse_CDT4___MinGW_Makefiles_gcc_g__Debug_None'




echo 'begin: test_buildBenchmarkExcludeTarget_output_Eclipse_CDT4___MinGW_Makefiles_gcc_g__Release_None'
cd tests_benchmarks
py -3 build.py --generator "Eclipse CDT4 - MinGW Makefiles" --profile Release --c_compiler gcc --cxx_compiler g++ --clean --run_benchmarks --benchmark_exclude FactorialIterativeBenchmark --output output_Eclipse_CDT4_-_MinGW_Makefiles_gcc_g++_Release_None
cd ..
echo 'end: test_buildBenchmarkExcludeTarget_output_Eclipse_CDT4___MinGW_Makefiles_gcc_g__Release_None'







echo 'begin: test_buildBenchmarkExcludeTarget_output_MinGW_Makefiles_gcc_g__Debug_None'
cd tests_benchmarks
py -3 build.py --generator "MinGW Makefiles" --profile Debug --c_compiler gcc --cxx_compiler g++ --clean --run_benchmarks --benchmark_exclude FactorialIterativeBenchmark --output output_MinGW_Makefiles_gcc_g++_Debug_None
cd ..
echo 'end: test_buildBenchmarkExcludeTarget_output_MinGW_Makefiles_gcc_g__Debug_None'


echo 'begin: test_buildBenchmarkExcludeTarget_output_MinGW_Makefiles_gcc_g__Release_None'
cd tests_benchmarks
py -3 build.py --generator "MinGW Makefiles" --profile Release --c_compiler gcc --cxx_compiler g++ --clean --run_benchmarks --benchmark_exclude FactorialIterativeBenchmark --output output_MinGW_Makefiles_gcc_g++_Release_None
cd ..
echo 'end: test_buildBenchmarkExcludeTarget_output_MinGW_Makefiles_gcc_g__Release_None'



echo 'begin: test_buildBenchmarkExcludeTarget_output_Visual_Studio_16_2019_cl_cl_Debug_None'
cd tests_benchmarks
py -3 build.py --generator "Visual Studio 16 2019" --profile Debug --c_compiler cl --cxx_compiler cl --clean --run_benchmarks --benchmark_exclude FactorialIterativeBenchmark --output output_Visual_Studio_16_2019_cl_cl_Debug_None
cd ..
echo 'end: test_buildBenchmarkExcludeTarget_output_Visual_Studio_16_2019_cl_cl_Debug_None'



echo 'begin: test_buildBenchmarkExcludeTarget_output_Visual_Studio_16_2019_cl_cl_Release_None'
cd tests_benchmarks
py -3 build.py --generator "Visual Studio 16 2019" --profile Release --c_compiler cl --cxx_compiler cl --clean --run_benchmarks --benchmark_exclude FactorialIterativeBenchmark --output output_Visual_Studio_16_2019_cl_cl_Release_None
cd ..
echo 'end: test_buildBenchmarkExcludeTarget_output_Visual_Studio_16_2019_cl_cl_Release_None'


echo 'begin: test_buildBenchmarkIncludeTarget_output_Eclipse_CDT4___MinGW_Makefiles_gcc_g__Debug_None'
cd tests_benchmarks
py -3 build.py --generator "Eclipse CDT4 - MinGW Makefiles" --profile Debug --c_compiler gcc --cxx_compiler g++ --clean --run_benchmarks --benchmark_include FactorialIterativeBenchmark --output output_Eclipse_CDT4_-_MinGW_Makefiles_gcc_g++_Debug_None
cd ..
echo 'end: test_buildBenchmarkIncludeTarget_output_Eclipse_CDT4___MinGW_Makefiles_gcc_g__Debug_None'


echo 'begin: test_buildBenchmarkIncludeTarget_output_Eclipse_CDT4___MinGW_Makefiles_gcc_g__Release_None'
cd tests_benchmarks
py -3 build.py --generator "Eclipse CDT4 - MinGW Makefiles" --profile Release --c_compiler gcc --cxx_compiler g++ --clean --run_benchmarks --benchmark_include FactorialIterativeBenchmark --output output_Eclipse_CDT4_-_MinGW_Makefiles_gcc_g++_Release_None
cd ..
echo 'end: test_buildBenchmarkIncludeTarget_output_Eclipse_CDT4___MinGW_Makefiles_gcc_g__Release_None'



echo 'begin: test_buildBenchmarkIncludeTarget_output_MinGW_Makefiles_gcc_g__Debug_None'
cd tests_benchmarks
py -3 build.py --generator "MinGW Makefiles" --profile Debug --c_compiler gcc --cxx_compiler g++ --clean --run_benchmarks --benchmark_include FactorialIterativeBenchmark --output output_MinGW_Makefiles_gcc_g++_Debug_None
cd ..
echo 'end: test_buildBenchmarkIncludeTarget_output_MinGW_Makefiles_gcc_g__Debug_None'



echo 'begin: test_buildBenchmarkIncludeTarget_output_MinGW_Makefiles_gcc_g__Release_None'
cd tests_benchmarks
py -3 build.py --generator "MinGW Makefiles" --profile Release --c_compiler gcc --cxx_compiler g++ --clean --run_benchmarks --benchmark_include FactorialIterativeBenchmark --output output_MinGW_Makefiles_gcc_g++_Release_None
cd ..
echo 'end: test_buildBenchmarkIncludeTarget_output_MinGW_Makefiles_gcc_g__Release_None'





echo 'begin: test_buildBenchmarkIncludeTarget_output_Visual_Studio_16_2019_cl_cl_Debug_None'
cd tests_benchmarks
py -3 build.py --generator "Visual Studio 16 2019" --profile Debug --c_compiler cl --cxx_compiler cl --clean --run_benchmarks --benchmark_include FactorialIterativeBenchmark --output output_Visual_Studio_16_2019_cl_cl_Debug_None
cd ..
echo 'end: test_buildBenchmarkIncludeTarget_output_Visual_Studio_16_2019_cl_cl_Debug_None'





echo 'begin: test_buildBenchmarkIncludeTarget_output_Visual_Studio_16_2019_cl_cl_Release_None'
cd tests_benchmarks
py -3 build.py --generator "Visual Studio 16 2019" --profile Release --c_compiler cl --cxx_compiler cl --clean --run_benchmarks --benchmark_include FactorialIterativeBenchmark --output output_Visual_Studio_16_2019_cl_cl_Release_None
cd ..
echo 'end: test_buildBenchmarkIncludeTarget_output_Visual_Studio_16_2019_cl_cl_Release_None'


echo 'begin: test_buildTestExcludeTarget_output_Eclipse_CDT4___MinGW_Makefiles_gcc_g__Debug_None'
cd tests_benchmarks
py -3 build.py --generator "Eclipse CDT4 - MinGW Makefiles" --profile Debug --c_compiler gcc --cxx_compiler g++ --clean --run_tests --test_exclude FactorialIterativeTest --output output_Eclipse_CDT4_-_MinGW_Makefiles_gcc_g++_Debug_None
cd ..
echo 'end: test_buildTestExcludeTarget_output_Eclipse_CDT4___MinGW_Makefiles_gcc_g__Debug_None'


echo 'begin: test_buildTestExcludeTarget_output_Eclipse_CDT4___MinGW_Makefiles_gcc_g__Release_None'
cd tests_benchmarks
py -3 build.py --generator "Eclipse CDT4 - MinGW Makefiles" --profile Release --c_compiler gcc --cxx_compiler g++ --clean --run_tests --test_exclude FactorialIterativeTest --output output_Eclipse_CDT4_-_MinGW_Makefiles_gcc_g++_Release_None
cd ..
echo 'end: test_buildTestExcludeTarget_output_Eclipse_CDT4___MinGW_Makefiles_gcc_g__Release_None'


echo 'begin: test_buildTestExcludeTarget_output_MinGW_Makefiles_gcc_g__Debug_None'
cd tests_benchmarks
py -3 build.py --generator "MinGW Makefiles" --profile Debug --c_compiler gcc --cxx_compiler g++ --clean --run_tests --test_exclude FactorialIterativeTest --output output_MinGW_Makefiles_gcc_g++_Debug_None
cd ..
echo 'end: test_buildTestExcludeTarget_output_MinGW_Makefiles_gcc_g__Debug_None'






echo 'begin: test_buildTestExcludeTarget_output_MinGW_Makefiles_gcc_g__Release_None'
cd tests_benchmarks
py -3 build.py --generator "MinGW Makefiles" --profile Release --c_compiler gcc --cxx_compiler g++ --clean --run_tests --test_exclude FactorialIterativeTest --output output_MinGW_Makefiles_gcc_g++_Release_None
cd ..
echo 'end: test_buildTestExcludeTarget_output_MinGW_Makefiles_gcc_g__Release_None'



echo 'begin: test_buildTestExcludeTarget_output_Visual_Studio_16_2019_cl_cl_Debug_None'
cd tests_benchmarks
py -3 build.py --generator "Visual Studio 16 2019" --profile Debug --c_compiler cl --cxx_compiler cl --clean --run_tests --test_exclude FactorialIterativeTest --output output_Visual_Studio_16_2019_cl_cl_Debug_None
cd ..
echo 'end: test_buildTestExcludeTarget_output_Visual_Studio_16_2019_cl_cl_Debug_None'





echo 'begin: test_buildTestExcludeTarget_output_Visual_Studio_16_2019_cl_cl_Release_None'
cd tests_benchmarks
py -3 build.py --generator "Visual Studio 16 2019" --profile Release --c_compiler cl --cxx_compiler cl --clean --run_tests --test_exclude FactorialIterativeTest --output output_Visual_Studio_16_2019_cl_cl_Release_None
cd ..
echo 'end: test_buildTestExcludeTarget_output_Visual_Studio_16_2019_cl_cl_Release_None'






echo 'begin: test_buildTestIncludeTarget_output_Eclipse_CDT4___MinGW_Makefiles_gcc_g__Debug_None'
cd tests_benchmarks
py -3 build.py --generator "Eclipse CDT4 - MinGW Makefiles" --profile Debug --c_compiler gcc --cxx_compiler g++ --clean --run_tests --test_include FactorialIterativeTest --output output_Eclipse_CDT4_-_MinGW_Makefiles_gcc_g++_Debug_None
cd ..
echo 'end: test_buildTestIncludeTarget_output_Eclipse_CDT4___MinGW_Makefiles_gcc_g__Debug_None'






echo 'begin: test_buildTestIncludeTarget_output_Eclipse_CDT4___MinGW_Makefiles_gcc_g__Release_None'
cd tests_benchmarks
py -3 build.py --generator "Eclipse CDT4 - MinGW Makefiles" --profile Release --c_compiler gcc --cxx_compiler g++ --clean --run_tests --test_include FactorialIterativeTest --output output_Eclipse_CDT4_-_MinGW_Makefiles_gcc_g++_Release_None
cd ..
echo 'end: test_buildTestIncludeTarget_output_Eclipse_CDT4___MinGW_Makefiles_gcc_g__Release_None'




echo 'begin: test_buildTestIncludeTarget_output_MinGW_Makefiles_gcc_g__Debug_None'
cd tests_benchmarks
py -3 build.py --generator "MinGW Makefiles" --profile Debug --c_compiler gcc --cxx_compiler g++ --clean --run_tests --test_include FactorialIterativeTest --output output_MinGW_Makefiles_gcc_g++_Debug_None
cd ..
echo 'end: test_buildTestIncludeTarget_output_MinGW_Makefiles_gcc_g__Debug_None'










echo 'begin: test_buildTestIncludeTarget_output_MinGW_Makefiles_gcc_g__Release_None'
cd tests_benchmarks
py -3 build.py --generator "MinGW Makefiles" --profile Release --c_compiler gcc --cxx_compiler g++ --clean --run_tests --test_include FactorialIterativeTest --output output_MinGW_Makefiles_gcc_g++_Release_None
cd ..
echo 'end: test_buildTestIncludeTarget_output_MinGW_Makefiles_gcc_g__Release_None'



echo 'begin: test_buildTestIncludeTarget_output_Visual_Studio_16_2019_cl_cl_Debug_None'
cd tests_benchmarks
py -3 build.py --generator "Visual Studio 16 2019" --profile Debug --c_compiler cl --cxx_compiler cl --clean --run_tests --test_include FactorialIterativeTest --output output_Visual_Studio_16_2019_cl_cl_Debug_None
cd ..
echo 'end: test_buildTestIncludeTarget_output_Visual_Studio_16_2019_cl_cl_Debug_None'




echo 'begin: test_runBenchmarkOnly_output_Eclipse_CDT4___MinGW_Makefiles_gcc_g__Release_None'
cd tests_benchmarks
py -3 build.py --generator "Eclipse CDT4 - MinGW Makefiles" --profile Release --c_compiler gcc --cxx_compiler g++ --clean --output output_Eclipse_CDT4_-_MinGW_Makefiles_gcc_g++_Release_None
py -3 build.py --generator "Eclipse CDT4 - MinGW Makefiles" --profile Release --c_compiler gcc --cxx_compiler g++ --run_benchmarks_only  --output output_Eclipse_CDT4_-_MinGW_Makefiles_gcc_g++_Release_None
cd ..
echo 'end: test_runBenchmarkOnly_output_Eclipse_CDT4___MinGW_Makefiles_gcc_g__Release_None'






echo 'begin: test_runBenchmarkOnly_output_MinGW_Makefiles_gcc_g__Debug_None'
cd tests_benchmarks
py -3 build.py --generator "MinGW Makefiles" --profile Debug --c_compiler gcc --cxx_compiler g++ --clean --outputoutput_MinGW_Makefiles_gcc_g
py -3 build.py --generator "MinGW Makefiles" --profile Release --c_compiler gcc --cxx_compiler g++ --run_benchmarks_only --output output_MinGW_Makefiles_gcc_g
cd ..
echo 'end: test_runBenchmarkOnly_output_MinGW_Makefiles_gcc_g__Debug_None'






echo 'begin: test_runBenchmarkOnly_output_Visual_Studio_16_2019_cl_cl_Debug_None'
cd tests_benchmarks
py -3 build.py --generator "Visual Studio 16 2019" --profile Debug --c_compiler cl --cxx_compiler cl --clean --output output_Visual_Studio_16_2019_cl_cl_Debug_None
py -3 build.py --generator "Visual Studio 16 2019" --profile Debug --c_compiler cl --cxx_compiler cl --run_benchmarks_only --output output_Visual_Studio_16_2019_cl_cl_Debug_None
cd ..
echo 'end: test_runBenchmarkOnly_output_Visual_Studio_16_2019_cl_cl_Debug_None'







echo 'begin: test_runBenchmarkOnly_output_Visual_Studio_16_2019_cl_cl_Release_None'
cd tests_benchmarks
py -3 build.py --generator "Visual Studio 16 2019" --profile Release --c_compiler cl --cxx_compiler cl --clean --output output_Visual_Studio_16_2019_cl_cl_Release_None
py -3 build.py --generator "Visual Studio 16 2019" --profile Release --c_compiler cl --cxx_compiler cl --run_benchmarks_only --output output_Visual_Studio_16_2019_cl_cl_Release_None
cd ..
echo 'end: test_runBenchmarkOnly_output_Visual_Studio_16_2019_cl_cl_Release_None'






echo 'begin: test_runTestsOnly_output_Eclipse_CDT4___MinGW_Makefiles_gcc_g__Debug_None'
cd tests_benchmarks
py -3 build.py --generator "Eclipse CDT4 - MinGW Makefiles" --profile Debug --c_compiler gcc --cxx_compiler g++ --clean --output output_Eclipse_CDT4_-_MinGW_Makefiles_gcc_g++_Debug_None
py -3 build.py --generator "Eclipse CDT4 - MinGW Makefiles" --profile Debug --c_compiler gcc --cxx_compiler g++ --run_tests_only --output output_Eclipse_CDT4_-_MinGW_Makefiles_gcc_g++_Debug_None
cd ..
echo 'end: test_runTestsOnly_output_Eclipse_CDT4___MinGW_Makefiles_gcc_g__Debug_None'



echo 'begin: test_runTestsOnly_output_Eclipse_CDT4___MinGW_Makefiles_gcc_g__Release_None'
cd tests_benchmarks
py -3 build.py --generator "Eclipse CDT4 - MinGW Makefiles" --profile Release --c_compiler gcc --cxx_compiler g++ --clean --output output_Eclipse_CDT4_-_MinGW_Makefiles_gcc_g++_Release_None
py -3 build.py --generator "Eclipse CDT4 - MinGW Makefiles" --profile Release --c_compiler gcc --cxx_compiler g++ --run_tests_only --output output_Eclipse_CDT4_-_MinGW_Makefiles_gcc_g++_Release_None
cd ..
echo 'end: test_runTestsOnly_output_Eclipse_CDT4___MinGW_Makefiles_gcc_g__Release_None'




echo 'begin: test_runTestsOnly_output_MinGW_Makefiles_gcc_g__Debug_None'
cd tests_benchmarks
py -3 build.py --generator "MinGW Makefiles" --profile Debug --c_compiler gcc --cxx_compiler g++ --clean --output output_MinGW_Makefiles_gcc_g++_Debug_None
py -3 build.py --generator "MinGW Makefiles" --profile Debug --c_compiler gcc --cxx_compiler g++ --run_tests_only --output output_MinGW_Makefiles_gcc_g++_Debug_None
cd ..
echo 'end: test_runTestsOnly_output_MinGW_Makefiles_gcc_g__Debug_None'





echo 'begin: test_runTestsOnly_output_MinGW_Makefiles_gcc_g__Release_None'
cd tests_benchmarks
py -3 build.py --generator "MinGW Makefiles" --profile Release --c_compiler gcc --cxx_compiler g++ --clean --output output_MinGW_Makefiles_gcc_g++_Release_None
py -3 build.py --generator "MinGW Makefiles" --profile Release --c_compiler gcc --cxx_compiler g++ --run_tests_only --output output_MinGW_Makefiles_gcc_g++_Release_None
cd ..
echo 'end: test_runTestsOnly_output_MinGW_Makefiles_gcc_g__Release_None'





echo 'begin: test_runTestsOnly_output_Visual_Studio_16_2019_cl_cl_Debug_None'
cd tests_benchmarks
py -3 build.py --generator "Visual Studio 16 2019" --profile Debug --c_compiler cl --cxx_compiler cl --clean --output output_Visual_Studio_16_2019_cl_cl_Debug_None
py -3 build.py --generator "Visual Studio 16 2019" --profile Debug --c_compiler cl --cxx_compiler cl --run_tests_only --output output_Visual_Studio_16_2019_cl_cl_Debug_None
cd ..
echo 'end: test_runTestsOnly_output_Visual_Studio_16_2019_cl_cl_Debug_None'



echo 'begin: test_runTestsOnly_output_Visual_Studio_16_2019_cl_cl_Release_None'
cd tests_benchmarks
py -3 build.py --generator "Visual Studio 16 2019" --profile Release --c_compiler cl --cxx_compiler cl --clean --output output_Visual_Studio_16_2019_cl_cl_Release_None
py -3 build.py --generator "Visual Studio 16 2019" --profile Release --c_compiler cl --cxx_compiler cl --run_tests_only --output output_Visual_Studio_16_2019_cl_cl_Release_None
cd ..
echo 'end: test_runTestsOnly_output_Visual_Studio_16_2019_cl_cl_Release_None'






echo 'begin: test_definePass_output_Eclipse_CDT4___MinGW_Makefiles_gcc_g__Debug_None'
cd tests_benchmarks
py -3 build.py --generator "Eclipse CDT4 - MinGW Makefiles" --profile Debug --c_compiler gcc --cxx_compiler g++ --clean --c_definitions THIS_IS_DEFINE THIS_IS_DEFINE_VALUE=1 --output output_Eclipse_CDT4_-_MinGW_Makefiles_gcc_g++_Debug_None
cd ..
echo 'end: test_definePass_output_Eclipse_CDT4___MinGW_Makefiles_gcc_g__Debug_None'






echo 'begin: test_definePass_output_Eclipse_CDT4___MinGW_Makefiles_gcc_g__Release_None'
cd tests_benchmarks
py -3 build.py --generator "Eclipse CDT4 - MinGW Makefiles" --profile Release --c_compiler gcc --cxx_compiler g++ --clean --c_definitions THIS_IS_DEFINE THIS_IS_DEFINE_VALUE=1 --output output_Eclipse_CDT4_-_MinGW_Makefiles_gcc_g++_Release_None
cd ..
echo 'end: test_definePass_output_Eclipse_CDT4___MinGW_Makefiles_gcc_g__Release_None'




echo 'begin: test_generateOnly_output_Eclipse_CDT4___MinGW_Makefiles_gcc_g__Debug_None'
cd tests_benchmarks
py -3 build.py --generator "Eclipse CDT4 - MinGW Makefiles" --profile Debug --c_compiler gcc --cxx_compiler g++ --clean --generate_only --output output_Eclipse_CDT4_-_MinGW_Makefiles_gcc_g++_Debug_None
cd ..
echo 'end: test_generateOnly_output_Eclipse_CDT4___MinGW_Makefiles_gcc_g__Debug_None'





echo 'begin: test_simpleBuildExe_output_Eclipse_CDT4___MinGW_Makefiles_gcc_g__Debug_None'
cd tests_benchmarks
py -3 build.py --generator "Eclipse CDT4 - MinGW Makefiles" --profile Debug --c_compiler gcc --cxx_compiler g++ --clean --output output_Eclipse_CDT4_-_MinGW_Makefiles_gcc_g++_Debug_None
cd ..
echo 'end: test_simpleBuildExe_output_Eclipse_CDT4___MinGW_Makefiles_gcc_g__Debug_None'




echo 'begin: test_simpleBuildExe_output_Eclipse_CDT4___MinGW_Makefiles_gcc_g__Release_None'
cd tests_benchmarks
py -3 build.py --generator "Eclipse CDT4 - MinGW Makefiles" --profile Release --c_compiler gcc --cxx_compiler g++ --clean --output output_Eclipse_CDT4_-_MinGW_Makefiles_gcc_g++_Release_None
cd ..
echo 'end: test_simpleBuildExe_output_Eclipse_CDT4___MinGW_Makefiles_gcc_g__Release_None'




echo 'begin: test_simpleBuildExe_output_Eclipse_CDT4___Ninja_gcc_g__Debug_None'
cd tests_benchmarks
py -3 build.py --generator Eclipse CDT4 - Ninja --profile Debug --c_compiler gcc --cxx_compiler g++ --clean --output output_Eclipse_CDT4_-_Ninja_gcc_g++_Debug_None
cd ..
echo 'end: test_simpleBuildExe_output_Eclipse_CDT4___Ninja_gcc_g__Debug_None'






echo 'begin: test_simpleBuildExe_output_Eclipse_CDT4___Ninja_gcc_g__Debug_None'
cd tests_benchmarks
py -3 build.py --generator Eclipse CDT4 - Ninja --profile Debug --c_compiler gcc --cxx_compiler g++ --clean --output output_Eclipse_CDT4_-_Ninja_gcc_g++_Debug_None
cd ..
echo 'end: test_simpleBuildExe_output_Eclipse_CDT4___Ninja_gcc_g__Debug_None'





echo 'begin: test_simpleBuildExe_output_Eclipse_CDT4___Ninja_gcc_g__Release_None'
cd tests_benchmarks
py -3 build.py --generator Eclipse CDT4 - Ninja --profile Release --c_compiler gcc --cxx_compiler g++ --clean --output output_Eclipse_CDT4_-_Ninja_gcc_g++_Release_None
cd ..
echo 'end: test_simpleBuildExe_output_Eclipse_CDT4___Ninja_gcc_g__Release_None'






echo 'begin: test_simpleBuildExe_output_MinGW_Makefiles_gcc_g__Debug_None'
cd tests_benchmarks
py -3 build.py --generator "MinGW Makefiles" --profile Debug --c_compiler gcc --cxx_compiler g++ --clean --output output_MinGW_Makefiles_gcc_g++_Debug_None
cd ..
echo 'end: test_simpleBuildExe_output_MinGW_Makefiles_gcc_g__Debug_None'




echo 'begin: test_simpleBuildExe_output_MinGW_Makefiles_gcc_g__Release_None'
cd tests_benchmarks
py -3 build.py --generator "MinGW Makefiles" --profile Release --c_compiler gcc --cxx_compiler g++ --clean --output output_MinGW_Makefiles_gcc_g++_Release_None
cd ..
echo 'end: test_simpleBuildExe_output_MinGW_Makefiles_gcc_g__Release_None'







echo 'begin: test_simpleBuildExe_output_Ninja_gcc_g__Debug_None'
cd tests_benchmarks
py -3 build.py --generator Ninja --profile Debug --c_compiler gcc --cxx_compiler g++ --clean --output output_Ninja_gcc_g++_Debug_None
cd ..
echo 'end: test_simpleBuildExe_output_Ninja_gcc_g__Debug_None'


echo 'begin: test_simpleBuildExe_output_Ninja_gcc_g__Release_None'
cd tests_benchmarks
py -3 build.py --generator Ninja --profile Release --c_compiler gcc --cxx_compiler g++ --clean --output output_Ninja_gcc_g++_Release_None
cd ..
echo 'end: test_simpleBuildExe_output_Ninja_gcc_g__Release_None'







echo 'begin: test_simpleBuildExe_output_Visual_Studio_16_2019_cl_cl_Debug_None'
cd tests_benchmarks
py -3 build.py --generator "Visual Studio 16 2019" --profile Debug --c_compiler cl --cxx_compiler cl --clean --output output_Visual_Studio_16_2019_cl_cl_Debug_None
cd ..
echo 'end: test_simpleBuildExe_output_Visual_Studio_16_2019_cl_cl_Debug_None'







echo 'begin: test_simpleBuildExe_output_Visual_Studio_16_2019_cl_cl_Release_None'
cd tests_benchmarks
py -3 build.py --generator "Visual Studio 16 2019" --profile Release --c_compiler cl --cxx_compiler cl --clean --output output_Visual_Studio_16_2019_cl_cl_Release_None
cd ..
echo 'end: test_simpleBuildExe_output_Visual_Studio_16_2019_cl_cl_Release_None'


















