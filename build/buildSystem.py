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

class BuildSystemHelper:
    """
    Class that helps running CMake.
    """
    
    @staticmethod
    def __run(cmd, working_dir):
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
        proc = subprocess.Popen(cmd,
                                stdout = subprocess.PIPE,
                                stderr=subprocess.STDOUT,
                                cwd = working_dir,
                                shell=True,
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
            default='Debug')
        arg_parser.add_argument(
            '-c',
            '--clean',
            action='store_true'
            )
        arg_parser.add_argument(
            '-g',
            '--generator',
            )
        arg_parser.add_argument(
            '-t',
            '--target',
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
    
        cmd = ['cmake']
        cmd.append('-DCMAKE_BUILD_TYPE=' + args.profile)
        
        if args.generator:
            cmd.extend(['-G', args.generator])
            
        if args.clean:
            shutil.rmtree(output_path, ignore_errors=True)
            
        if not os.path.isdir(output_path):
            os.makedirs(output_path)
            
        if pre_generate_fun is not None:
            if not pre_generate_fun(args, input_path, output_path, cmd):
                return False
        
        cmd.append(input_path)
        
        return_code = BuildSystemHelper.__run(cmd, output_path)
        
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
        return_code = BuildSystemHelper.__run(cmd, build_path)
        
        return return_code
