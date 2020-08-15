# Python based build system with Conan.io support
The common approach of build system in many C++ project is to use CMake, Conan.io and Python just to trigger them. 

## CMake
CMake is a program that manages build system mostly for C/C++ projects. It is commonly used in C/C++ project (for example GoogleTest, Boost). It has its own not very intuitive language. Via CMake we can provide what source code, heade files, libraries, compilation flags shall be used for compilation and linking. It also supports triggering tests.

## Conan.io
Java has Maven & Gradle - dependency managers. Depenency managers are programs that downloads/builds external libraries, so we don't have to worry where we can find them, how to compile them and what we should do to compile them. Now C/C++ has its own dependency manager Conan.io - very helpful tool. 
You can find libaries on Conan.io website: https://conan.io/center/
Required libaries are defined in conanfile.txt like: https://github.com/iblis-ms/python_cmake_build_system/blob/master/code/conanfile.txt

## Python
Python is a scripting language which has very friendly API. It has argparse module, which is used for parsing command line arguments in very easy way. Python also supports subprocesses to run external programs and passing their outputs to the script, which is used for triggering CMake and passing arguments to it.

# Python -> CMake -> Conan.io
The approach of build system on this repo is to trigger Python, which runs CMake, which calls Conan.io. 
Firstly, Python calls CMake to generate build scripts with argument like build profile (Debug or Release). Let's assum build triggered by *py -3 build.py --clean --profile Release*. Explanation:
- *py -3* - runs script using Python3
- *build.py* - build script
- *--clean* - do a clean build - remove old output folder
- *--profile Release* - build in Release profile

CMake in generate stage downloads 'conan.cmake' file that is used for calling Conan.io with proper arguments. I put the file on repo just in case changes what break backward compatibility. See https://github.com/iblis-ms/python_cmake_build_system/blob/master/code/CMakeLists.txt 
```
set(CONAN_CMAKE_FILE "${CMAKE_CURRENT_SOURCE_DIR}/conan.cmake") # set path to file

if(NOT EXISTS "${CONAN_CMAKE_FILE}") # if not exist, download it
   message(STATUS "Downloading conan.cmake from https://github.com/conan-io/cmake-conan")
   file(DOWNLOAD "https://github.com/conan-io/cmake-conan/raw/v0.15/conan.cmake"
                 "${CONAN_CMAKE_FILE}")
endif()

include("${CONAN_CMAKE_FILE}") # include file to use functions from it.

set(CONAN_FILE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/conanfile.txt") # Path to conanfile.txt which says what libraries are required

file(RELATIVE_PATH CONAN_FILE_RELATIVE_PATH "${CMAKE_SOURCE_DIR}" "${CONAN_FILE_PATH}") # conan_cmake_run requires relative path

# Note that build type, architecture is detected by CMake, but you can overwrite it
# see https://github.com/conan-io/cmake-conan for details
conan_cmake_run(CONANFILE "${CONAN_FILE_RELATIVE_PATH}"
                BASIC_SETUP         # calls conan_basic_setup: https://docs.conan.io/en/latest/reference/generators/cmake.html
                CMAKE_TARGETS       # to use modern CMake approach: target_* function
                BUILD missing)      # build library if missing 
```
Then create CMake target:
```
set(SRC_DIR "${CMAKE_CURRENT_SOURCE_DIR}/src")

set(SRC
	"${SRC_DIR}/TestApp.cpp"
	)
	
add_executable(TestApplication "${SRC}")
```
And mark downloaded libraries to the target:
```
conan_target_link_libraries(TestApplication)
```
Now the generation stage is finished and all build scripts are location in `output` folder. Therefore, build.py script runs CMake command to build the program: *cmake --build . * from `output`.

# Can I use it in my project?
Yes, definetely. The goal of this repo is to share very generic solution of build system approach. In build/buildSystem.py there is a generic Python script to help working with CMake. You can extends it like it was done in build.py. I will extends the generic module to support more build system options, which are commonly used in C++ projects.

# Author
Marcin Serwach
I've got several years of experience in programming in C++ and in Java including commercial applications. I also know several other languages: Objective-C, Python, Bash, etc. However I prefer C++.

My LinkedIn profile: [Marcin Serwach](https://pl.linkedin.com/in/marcin-serwach-b8646679)
