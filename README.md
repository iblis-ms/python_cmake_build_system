# Python based build system with Conan.io support
The common approach of build system in many C++ project is to use CMake, Conan.io and Python just to trigger them. 
This build system supports:
- Clang, GCC, MS VC
- building debug, release modes,
- building static, shared, interface libraries and executable
- build and running tests
- Conan.io dependency manager
- running tests with sanitizers (Valgrind, Dr Memory, Clang/GCC Sanitizers)
- building tests selectively
- automatic copying of resources
- GoogleTest test framework
- custom test command
- moder CMake approach (target_* functions)
- CMake source groups that represents folder structure
- many logs levels
- saving logs to file
- configurable input (source code ) folder and output folder

Moreover, it hides tough many CMake call by 2 functons: addTarget and addTestTarget.

## CMake
CMake is a program that manages build system mostly for C/C++ projects. It is commonly used in C/C++ project (for example GoogleTest, Boost). It has its own not very intuitive language. Via CMake we can provide what source code, heade files, libraries, compilation flags shall be used for compilation and linking. It also supports triggering tests.

## Conan.io
Java has Maven & Gradle - dependency managers. Depenency managers are programs that downloads/builds external libraries, so we don't have to worry where we can find them and how to compile them. Now C/C++ has its own dependency manager Conan.io - a very helpful tool. 
You can find libaries on Conan.io website: https://conan.io/center/
Required libaries are defined in conanfile.txt like: https://github.com/iblis-ms/python_cmake_build_system/blob/master/code/conanfile.txt

## Python
Python is a scripting language which has very friendly API. It has argparse module, which is used for parsing command line arguments in very easy way. Python also supports subprocesses to run external programs and passing their outputs to the script, which is used for triggering CMake and passing arguments to it.

# Python -> CMake -> Conan.io
The approach of build system on this repo is to trigger Python, which runs CMake, which calls Conan.io. 
Firstly, Python calls CMake to generate build scripts with argument like build profile (Debug or Release). Let's assum build triggered by *python3 build.py --clean --profile Release*. Explanation:
- *python3* - runs script using Python3
- *build.py* - build script
- *--clean* - do a clean build - remove old output folder
- *--profile Release* - build in Release profile

CMake in generate stage can download 'conan.cmake' file that is used for calling Conan.io with proper arguments. However, I put the file on repo just in case changes what break backward compatibility (https://github.com/iblis-ms/python_cmake_build_system/blob/master/build/conan.cmake). 

The script build.py is just an entry point to call functions from buildSystem.py, which is the core of the Python part of the build system. The build.py can be adapted to other project needs. The module buildSystem.py is responsible for parsing arguments, preparing argument to CMake call. The module calls CMake to generate project. In this step CMake triggers Conan.io to download and build dependencies based on conaninfo.txt file. After that buildSystem.py runs CMake to build the project including tests. Finally, the module launches tests.
![Architecture](https://raw.githubusercontent.com/iblis-ms/python_cmake_build_system/master/doc/img/arch.png)

# Build system argument
```
optional arguments:
  -h, --help            show this help message and exit
  -p {Release,Debug}, --profile {Release,Debug}
                        Build type.
  -c, --clean           Clean build - remove output directory before
                        generation.
  -g GENERATOR, --generator GENERATOR
                        CMake generator.
  -go, --generate_only  Generate only.
  -c_c C_COMPILER, --c_compiler C_COMPILER
                        C compiler.
  -cxx_c CXX_COMPILER, --cxx_compiler CXX_COMPILER
                        CXX compiler.
  -t TARGET, --target TARGET
                        Target to build.
  -cm_def CMAKE_DEFINITIONS [CMAKE_DEFINITIONS ...], --cmake_definitions CMAKE_DEFINITIONS [CMAKE_DEFINITIONS ...]
                        Definitions to CMake.
  -c_def C_DEFINITIONS [C_DEFINITIONS ...], --c_definitions C_DEFINITIONS [C_DEFINITIONS ...]
                        Definitions to C/C++.
  -cpp_std {98,11,14,17,20}, --cpp_standard {98,11,14,17,20}
                        C++ standard
  -tests, --run_tests   Run tests.
  -tests_only, --run_tests_only
                        Run test only.
  -test_inc TEST_INCLUDE, --test_include TEST_INCLUDE
                        Include regex for test target.
  -test_exc TEST_EXCLUDE, --test_exclude TEST_EXCLUDE
                        Exclude regex for test target.
  -log_out LOG_OUTPUT_FILE, --log_output_file LOG_OUTPUT_FILE
                        Log output file
  -o OUTPUT, --output OUTPUT
                        Output folder
  -i INPUT, --input INPUT
                        Input folder
  -cm_log {ERROR,WARNING,NOTICE,STATUS,VERBOSE,DEBUG,TRACE}, --cmake_log_level {ERROR,WARNING,NOTICE,STATUS,VERBOSE,DEBUG,TRACE}
                        CMake Log level
  --gtest_filter GTEST_FILTER
                        GTest: Filter regex for running test cases.
  --gtest_color {no,yes,auto}
                        GTest: Use colorful logs.
  --gtest_also_run_disabled_tests
                        GTest: Run also disabled tests.
  --gtest_repeat GTEST_REPEAT
                        GTest: Indicate how many times tests shall be run.
  --gtest_brief         GTest: Prints only failures.
  --gtest_shuffle       GTest: Shuffle tests.
  --gtest_print_time    GTest: Do not print execution time
  --gtest_output GTEST_OUTPUT
                        GTest: Path to output file with details.
  --gtest_list_tests    GTest: Print only tests case.
  --gtest_fail_fast     GTest: Stop after the first failure.
  --gtest_print_utf8    GTest: Print in utf-8.
  --gtest_random_seed GTEST_RANDOM_SEED
                        GTest: Seed for shuffle.
  -san {dr_memory}, --sanitizer {dr_memory}
                        Memory sanitizer like: Dr Memory, Valgrind
```
Examples:
Linux:
```
python3 build.py --profile Release --generator Unix Makefiles --c_compiler gcc --cxx_compiler g++ --cpp_standard 17 --run_tests --log_output_file log.txt
```

```

python3 build.py --profile Debug --generator Unix Makefiles --c_compiler gcc --cxx_compiler g++ --cpp_standard 20 
```

```
python3 build.py --profile Release --generator Unix Makefiles --c_compiler clang --cxx_compiler clang++
```
OSX:
```
python3 build.py --profile Release --generator Unix Makefiles --c_compiler gcc --cxx_compiler g++ --cpp_standard 17 --run_tests --clean --log_output_file log.txt --output outputFolder
```

```
python3 build.py --profile Release --generator Unix Makefiles --c_compiler gcc --cxx_compiler g++ --cpp_standard 17 --run_tests --clean --log_output_file log.txt
```

```
python3 build.py --profile Release --generator Xcode --c_compiler gcc --cxx_compiler g++ --cpp_standard 17 --run_tests --clean --log_output_file log.txt
```

```
python3 build.py --profile Release --generator Xcode 
```

# CMakeLists  
```
addTarget(
    TARGET_NAME "FactorialStatic"               # name of target
    TARGET_TYPE "EXE"                           # type of target EXE, STATIC, SHARED, INTERFACE
    SRC "a.cpp" "b.cpp;src/folder/d.cpp"        # source files
    PUBLIC_INC_DIRS "/inc/public" "include"     # folders with header files - target public API
    PRIVATE_INC_DIRS "inc/private" "private"    # folders with header files - private header, not available for other targets
    PUBLIC_LIBS "lib1;lib2" "libA"              # libraries to link - their API is also this target API
    PRIVATE_LIBS "lib1;lib2" "libA"             # libraries to link - their API is hidden, not available for other targets.
    PUBLIC_DEFINES "DEF" "GHI=1"                # C/C++ defines - public defines visible for other targets    
    PRIVATE_DEFINES "JK=23"                     # C/C++ defines - not visible for other targets
    PUBLIC_LINK_OPTIONS "-fsanitize=address"    # linker arguments
    PRIVATE_LINK_OPTIONS "-fno-omit-frame-pointer" # linker aguments
    PUBLIC_COMPILE_OPTIONS "-fsanitize=memory"          # compile options
    PRIVATE_COMPILE_OPTIONS "-fno-omit-frame-pointer"   # compile options
    RESOURCES_TO_COPY_TO_EXE_DIR "res.jpg" "resFolder"  # resources (files and folder) that will be copied to executable location or if given target is not executable, resources will be copied to all executable targets that link this target
    RESOURCES_TO_COPY "res.png" TO "folder/somewhere" # as RESOURCES_TO_COPY_TO_EXE_DIR but destination point is required ('TO' is also required)
	)

```
All multiarguments options can receive a list of values or values one by one.

# Can I use it in my project?
Yes, definetely. The goal of this repo is to share very generic solution of build system approach. In build/buildSystem.py there is a generic Python script to help working with CMake. You can extends it like it was done in build.py. I will extends the generic module to support more build system options, which are commonly used in C++ projects.

# Author
Marcin Serwach

I've got several years of experience in programming in C++ and in Java including commercial applications. I also know several other languages: Objective-C, Python, Bash, etc. However I prefer C++.

My LinkedIn profile: [Marcin Serwach](https://pl.linkedin.com/in/marcin-serwach-b8646679)
