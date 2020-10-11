#!/usr/bin/python3 

# Author: Marcin Serwach
# License: MIT
# ULR: https://github.com/iblis-ms/python_cmake_build_system

import argparse
import os
import subprocess
import shutil
from builtins import staticmethod
import sys
import requests
import platform 
from enum import IntEnum, unique

@unique
class CppStandard(IntEnum):
    CPP_98 = 98
    CPP_11 = 11
    CPP_14 = 14
    CPP_17 = 17
    CPP_20 = 20


class BuildSystemHelper:
    """
    Class that helps running CMake.
    """

    @staticmethod
    def __downloadScript(url, output_path):
        response = requests.get(url, allow_redirects=True)
        if response.status_code != 200:
            print('Downloading ' + str(url) + ' to ' + str(output_path) + ' FAILED')
            return False

        print('Downloading ' + str(url) + ' to ' + str(output_path))
        open(output_path, 'wb').write(response.content)
        return True

    @staticmethod
    def __downloadData():
        res = True
        script_dir_path = os.path.dirname(os.path.realpath(__file__))
        add_target_URL = 'https://raw.githubusercontent.com/iblis-ms/cmake_add_target/master/AddTarget.cmake'
        add_target_path = os.path.join(script_dir_path, 'addTarget.cmake')
        if not os.path.isfile(add_target_path):
            res = BuildSystemHelper.__downloadScript(add_target_URL, add_target_path)

        return res
    
    def __run(self, cmd, working_dir, env = None):
        """Runs given command in given working directory
        
        Parameters
        ----------
        cmd : array 
            Command to run. The program and each argument is item in the array, i. e. ['echo', '${PATH']
        working_dir : string 
            orking directory - location from command will be run
            
        Returns
        -------
        int
            Error code from run command. 0 means finished successfully.
        """
        
        os.environ['PYTHONUNBUFFERED'] = "1" # to not buffer logs, but print immediately 
        print("####################################### <run> #######################################")
        print("Working Directory: " + working_dir)
        print("Command: " + ' '.join(cmd))
        shell = False
        if self.windows:
            self = True
        proc = subprocess.Popen(cmd,
                                stdout = subprocess.PIPE,
                                stderr=subprocess.STDOUT,
                                cwd = working_dir,
                                shell=shell, 
                                env = env
                                )
        print("-------------------------------------- <output> -------------------------------------")

        while True:
            output = proc.stdout.readline()
            pol = proc.poll()
           
            if (output == '' or output == b'') and pol is not None:
                break
            if output:
                sys.stdout.buffer.write(output) 
                sys.stdout.flush()
                
        return_code = proc.poll()
        
        print("-------------------------------------- </output> ------------------------------------")
        print("Return code: " + str(return_code))
        print("####################################### </run> ######################################")
        
        return return_code

        
    def __init__(self):

        self.windows = False
        self.linux = False
        self.macos = False
        plt = platform.system()

        if plt == "Windows":
            self.windows = True
        elif plt == "Linux":
            self.linux = True
        elif plt == "Darwin":
            self.macos = True
        else:
            print("Unidentified system")

    def get_argument_parser_items(self, description):
        """Get argParse object with generic params.
        
        Parameters
        ----------
        description : string 
            Description.
            
        Returns
        -------
        ArgumentParser
            Client side can append arguments
        """
        arg_parser = argparse.ArgumentParser(description=description)
        
        arg_parser.add_argument(
            '-p', 
            '--profile', 
            choices=['Release', 'Debug'], 
            default='Debug',
            help='Build type.')
        arg_parser.add_argument(
            '-c',
            '--clean',
            action='store_true',
            help='Clean build - remove output directory before generation.'
            )
        arg_parser.add_argument(
            '-g',
            '--generator',
            help='CMake generator.'
            )
        arg_parser.add_argument(
            '-go',
            '--generate_only',
            help='Generate only.',
            action="store_true"
            )
        arg_parser.add_argument(
            '-t',
            '--target',
            help='Target to build.'
            )
        arg_parser.add_argument(
            '-cm_def',
            '--cmake_definitions',
            help='Definitions to CMake.',
            action="extend",
            nargs="+", 
            type=str
            )

        cpp_std_choice = []
        for std in CppStandard:
            cpp_std_choice.append(std.value)

        arg_parser.add_argument(
            '-cpp_std',
            '--cpp_standard',
            choices = cpp_std_choice,
            help='C++ standard',
            default=CppStandard.CPP_17.value
            )

        arg_parser.add_argument(
            '-test',
            '--run_test',
            help='Run test.',
            action="store_true"
            )
        arg_parser.add_argument(
            '-test_inc',
            '--test_include',
            help='Include regex for test target.'
            )
        arg_parser.add_argument(
            '-test_exc',
            '--test_exclude',
            help='Exclude regex for test target.'
            )
            
        memory_sanitizer = []
        clang_posix_sanitizers = ['memory_sanitizer', 'address_sanitizer', 'thread_sanitizer', 'undefined_behavior_sanitizer']
        if self.windows:
            memory_sanitizer.append('dr_memory')
        if self.linux:
            memory_sanitizer.append('valgrind')
            memory_sanitizer.extend(clang_posix_sanitizers)
        if self.macos:
            memory_sanitizer.append('valgrind')
            memory_sanitizer.extend(clang_posix_sanitizers)
              
        arg_parser.add_argument(
            '-san',
            '--sanitizer',
            choices = memory_sanitizer,
            help='Memory sanitizer like: Dr Memory, Valgrind'
            )

        return arg_parser
        
    def generate(self, args, input_path, output_path, pre_generate_fun = None):
        """Calls CMake to generate build script
        
        Parameters
        ----------
        args : argparse.Namespace 
            Parsed arguments.
        input_path : string 
            Path to folder where top CMakeLists.txt is located.
        output_path : string 
            Path to output folder.
        pre_generate_fun  
            Function called just before generation.
            
        Returns
        -------
        int
            Result code of run CMake.
        """
        self.__downloadData()

        cmd = ['cmake']
        
        if args.generator:
            cmd.extend(['-G', args.generator])

        cmd.append('-DCMAKE_BUILD_TYPE=' + args.profile)
        cmd.append('-DCMAKE_CXX_STANDARD=' + str(args.cpp_standard))

        if args.cmake_definitions is not None:
            for cmake_def in args.cmake_definitions:
                cmd.append('-D' + cmake_def)
        if args.test_include is not None:
            cmd.append('-DADD_TARGET_TEST_TARGET_INCLUDE=' + args.test_include)
        if args.test_exclude is not None:
            cmd.append('-DADD_TARGET_TEST_TARGET_EXCLUDE=' + args.test_include)
            
        if args.sanitizer is not None:
            if args.sanitizer == 'valgrind':
                cmd.append('-DADD_TARGET_VALGRIND=1')
            if args.sanitizer == 'dr_memory':
                cmd.append('-DADD_TARGET_DR_MEMORY=1')
            if args.sanitizer == 'memory_sanitizer':
                cmd.append('-DADD_TARGET_CLANG_MEMORY_SANITIZER=1')
            if args.sanitizer == 'address_sanitizer':
                cmd.append('-DADD_TARGET_CLANG_ADDRESS_SANITIZER=1')
            if args.sanitizer == 'thread_sanitizer':
                cmd.append('-DADD_TARGET_CLANG_THREAD_SANITIZER=1')
            if args.sanitizer == 'undefined_behavior_sanitizer':
                cmd.append('-DADD_TARGET_CLANG_UNDEFINED_BEHAVIOR_SANITIZER=1')
                
        if args.clean:
            shutil.rmtree(output_path, ignore_errors=True)
            
        if not os.path.isdir(output_path):
            os.makedirs(output_path)
            
        if pre_generate_fun is not None:
            if not pre_generate_fun(args, input_path, output_path, cmd):
                return False
        
        cmd.append(input_path)
        
        return_code = self.__run(cmd, output_path)
        
        return return_code

    def build(self, args, build_path):
        """Calls CMake to generate build script
        
        Parameters
        ----------
        args : argparse.Namespace 
            Parsed arguments.
        build_path : string
            Output path
            
        Returns
        -------
        int
            Result code of run CMake.
        """
        
        cmd = ['cmake', '--build', '.']
        
        if args.target is not None:
            cmd.extend(['--target', args.target])
            
        cmd.extend(['--config', args.profile])
        return_code = self.__run(cmd, build_path)
        
        return return_code

    def runTest(self,  output_path, gtestColorOutput = True):
        env = os.environ
        if gtestColorOutput:
            env["GTEST_COLOR"] = '1'
        cmd = ['ctest', '--verbose']
        return_code = self.__run(cmd, output_path)
        
        return return_code

    def run(self, args, input_path, output_path):
        generate_result = self.generate(args, input_path, output_path)
        if generate_result != 0:
            return False
        if args.generate_only == True:
            return True

        build_result = self.build(args, output_path)
        if build_result != 0:
            return False;

        if args.run_test == True:
            test_result = self.runTest(output_path)
            if test_result != 0:
                return False

        return True

    def simpleRun(self, app_name, input_path = None, output_path = None):
        current_dir = os.getcwd();
        if input_path is None:
            input_path = os.path.join(current_dir, 'code')
        if output_path is None:
            output_path = os.path.join(current_dir, 'output')
        arg_parser = self.get_argument_parser_items(app_name)
        args = arg_parser.parse_args()
        return self.run(args, input_path, output_path)



