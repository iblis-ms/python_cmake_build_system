This folder contains an example of usage the build system infrastructure. This project shows how to 

- use provided CMake *addTarget* & *addTestTarget* functions
- manage internal and external dependencies (Conan.io)
- operate on resources
- run unit tests with and without sanitizers
- compile with MS VC, clang (Linux and MacOS), gcc

The functionality of this project is just to calculate factorial in iterative way:
$$
n! = 
  \begin{cases}
  \prod_{k=1}^{n}{k}  & \quad \text{if } k \geq 0\\
  1  & \quad \text{if } k = 0
  \end{cases}
$$
and recursive way:
$$
n! = 
  \begin{cases}
  n \cdot (n-1)!  & \quad \text{if } k \geq 0\\
  1  & \quad \text{if } k = 0
  \end{cases}
$$
API has 3 options to calculate factorial by providing:

1. an input number directly to the calculate function,
2. a path to a text file that contains an input value,
3. a path to a folder that contains file with an input value.

Options 2. and 3. were added to test a support of a resource management. 

# Architecture of example project

 



![Architecture_of_example](https://raw.githubusercontent.com/iblis-ms/python_cmake_build_system/master/doc/img/components.png)

**FactorialInterface** - A CMake interface library target that has only public API. It contains only header files. It is a header-only library.

**FactorialIterative** - A static library that has functions to calculate factorial in iterative way. The component has unit tests and resources (files and folders) to run them.

**FactorialRecursive** - As **FactorialIterative** but the calculation is done in recursive way.

**FactorialStaticLib** - A component that links **FactorialIterative** & **FactorialRecursive**, but doesn't expose their APIs. It is a static library.

**FactorialSharedLib** - As FactorialStaticLib, but it is a shared library.

**FactorialStatic** - An executable target with a statically linked **FactorialStaticLib**

**FactorialShared** - An executable target that requires a shared library **FactorialSharedLib**



The architecture is softly based on abstract factory patter. 

![class_diagram](https://raw.githubusercontent.com/iblis-ms/python_cmake_build_system/master/doc/img/class_diagram.png)

# Tests

All tests cases were built with Debug and Release profiles. For each configuration unit tests were built and run.

Code use content from std::filesystem, which was introduced in C++17.



Test builds are done on Travis (Linux & MacOS) & AppVeyor (Windows).

## Linux (Ubuntu)

Tests run on Docker image.

- CMake generator: *Unix Makefiles*
- Profiles: *Debug* & *Release*
- Compiler set: *gcc/g++ & clang/clang++*
- C++ standard: 17 & 20 

Checking if debug symbols are only in binaries from debug build is done by checking output of *nm* program.

Therefore,  there are 8 cases:

1x Generators * 2x Profiles * 2x Compiler Sets * 2x C++ standard = 8 cases

**Example of test command**

```
python3 build.py --profile Release --generator "Unix Makefiles" --c_compiler gcc --cxx_compiler g++ --cpp_standard 17 --run_tests --log_output_file log.txt --output outputFolder 
```

which means:

- *--profile Release*  **<--** Release profile
- *--generator "Unix Makefiles"* **<--** Unix Makefile CMake generator
- *--c_compiler gcc* **<--** GCC compiler
- *--cxx_compiler g++* **<--** G++ compiler
- *--cpp_standard 17* **<--** C++17
- *--run_tests* **<--** Build and run unit tests
- --clean **<--** Remove output directory if exists before building
- *--log_output_file log.txt*  **<--** Save logs to file log.txt in folder provided in --output
- *--output output*Folder **<--** Output folder 

### Sanitizers

There is checked an execution of clang address sanitizer, by providing C/C++ defines that enables memory leak:

```
TEST(IterativeTest, calcFromDir)
{
    CFactorialIterative factorial;
    const std::filesystem::path path("iterative_dir");
    ASSERT_EQ(factorial.calcFromFile(path), 720u);
    
#ifdef SANITIZER_ENABLE /// define to enable memmory leak
	std::cout<<"SANITIZER_ENABLE enabled\n";
    int* ptrMemoryLeakIterative = new int; // memory leak
    int uninitializedIterative;
    if (uninitializedIterative)
    {
		return;
	}
#endif 
}
```

The build system supports providing C/C++ defines. Therefore by this test it is possible to check if C/C++ define is property set and if clang sanitizer is working. The command is:

```
python3 build.py --profile Debug --generator Unix Makefiles --c_compiler clang --cxx_compiler clang++ --cpp_standard 20 --run_tests --clean --log_output_file log.txt --outputFolder --sanitizer address_sanitizer --c_definitions SANITIZER_ENABLE=1
```

Which means:

- *--sanitizer address_sanitizer*  **<--** enable address sanitizer
- *--c_definitions SANITIZER_ENABLE=1* **<--** provide C/C++ define with value 1

The build system automatically provides compilation and link flags required to run sanitizer.

## MacOS

- CMake generator: *Unix Makefiles* & *Xcode*
- Profiles: *Debug* & *Release*
- Compiler set: clang/clang++ & gcc/g++
- C++ standard: 17 & 20 

Checking if debug symbols are only in binaries from debug build is done by checking output of *nm* program.

Therefore,  there are 16 cases:

2x Generators * 2x Profiles * 2x Compiler Sets * 2x C++ standard = 16 cases

**Example of a test command**

```
python3 build.py --profile Debug --generator Xcode --c_compiler clang --cxx_compiler clang++ --cpp_standard 17 --run_tests --clean --log_output_file log.txt --output outputFolder
```

which means:

- --profile Debug**<--** Debug profile
- *--generator "Xcode"* **<--** Xcode CMake generator
- --c_compiler clang **<--** Apple clang compiler
- *--cxx_compiler clang++* **<--** Apple clang compiler
- *--cpp_standard 17* **<--** C++17
- *--run_tests* **<--** Build and run unit tests
- --clean **<--** Remove output directory if exists before building
- *--log_output_file log.txt*  **<--** Save logs to file log.txt in folder provided in --output
- *--output output*Folder **<--** Output folder 

## Windows

- CMake generator: Visual Studio & MinGW Makefiles  & Ninja
- Profiles: *Debug* & *Release*
- Compiler set:  cl & gcc/g++
- C++ standard: 17 & 20 

Checking if debug symbols are only in binaries from debug build is done by checking if pdb file exists (Visual Studio generator).

Therefore,  there are 12 cases:

1x VS Generator * 2x Profiles * 1x Compiler Sets * 2x C++ standard +

2x MinGW & Ninja Generator * 2x Profiles * 1x Compiler Sets * 2x C++ standard =  12

**Example of a test command**

```
py -3 build.py --profile Debug --generator Ninja --c_compiler gcc --cxx_compiler g++ --cpp_standard 20 --run_tests --clean --log_output_file log.txt --output outputFolder
```

which means:

- --profile Debug**<--** Debug profile
- *--generator "Ninja"* **<--** Ninja CMake generator
- --c_compiler gcc **<--** gcc 
- *--cxx_compiler g++* **<--** g++
- *--cpp_standard 2*0 **<--** C++20
- *--run_tests* **<--** Build and run unit tests
- --clean **<--** Remove output directory if exists before building
- *--log_output_file log.txt*  **<--** Save logs to file log.txt in folder provided in --output
- *--output output*Folder **<--** Output folder 