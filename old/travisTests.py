#!/usr/bin/python3 

# Author: Marcin Serwach
# License: MIT
# ULR: https://github.com/iblis-ms/python_cmake_build_system

from build.utils import Utils
import os
import re
import logging
import sys

def linuxSanitizerAndDefines():
    current_dir = os.getcwd()
    logger = logging.getLogger("BuildSystem")
    
    profile = 'Debug'
    generator = 'Unix Makefiles'
    compiler = ['clang', 'clang++']
    cpp_standard = '20'
    
    logger.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")

    output = 'output_sanitizer' 
    
    cmd = ['python3', 'build.py', '--profile', profile, 
        '--generator', generator, 
        '--c_compiler', compiler[0], 
        '--cxx_compiler', compiler[1], 
        '--cpp_standard', cpp_standard, 
        '--run_tests', 
        '--clean',
        '--log_output_file', 'log.txt', 
        '--output',  os.path.join(current_dir, 'output', output),
       '--sanitizer', 'address_sanitizer',
        '--c_definitions', 'SANITIZER_ENABLE=1']
    
    return_code, output_txt = Utils.run(cmd, current_dir, collect_output = True)
    if return_code != 0:
        return False
        
    if not 'ERROR: LeakSanitizer: detected memory leaks' in output_txt:
        logger.error("Memory leak wasn't detected. Memory sanitizer wasn't run or define to enable memory leak wasn't passed to code.")
        return False
         
    logger.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")
    return True

def linuxAll():
    current_dir = os.getcwd()
    logger = logging.getLogger("BuildSystem")
    
    profiles = ['Release', 'Debug']
    generators = ['Unix Makefiles']
    compilers = [['gcc', 'g++'], ['clang', 'clang++']]
    cpp_standards = ['17', '20']
    
    for profile in profiles:
        for generator in generators:
            for compiler in compilers:
                for cpp_standard in cpp_standards:
                    logger.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")
                    buf = generator
                    output = 'output_' + profile + '_' + re.sub(' ', '_', generator) + '_' + re.sub(' ', '_', compiler[0]) + '_' + re.sub(' ', '_', compiler[1]) + '_' + cpp_standard
                    
                    cmd = ['python3', 'build.py', '--profile', profile, 
                        '--generator', generator, 
                        '--c_compiler', compiler[0], 
                        '--cxx_compiler', compiler[1], 
                        '--cpp_standard', cpp_standard, 
                        '--run_tests', 
                        '--log_output_file', 'log.txt', 
                        '--output',  os.path.join(current_dir, 'output', output)]
                    
                    return_code = Utils.run(cmd, current_dir)
                    if return_code != 0:
                        return False
                        
                    
                    fileArg = os.path.join(current_dir, 'output', output, 'factorial', 'factorialExeShared', 'FactorialShared')
                    cmd = ['file', fileArg]
                    return_code, output_txt = Utils.run(cmd, current_dir, collect_output = True)
                    if return_code != 0:
                        logger.error("Cannot run nm")
                        return False
                        
                    if profile == 'Release':
                        if 'with debug_info' in output_txt:
                            logger.error("File: " + str(fileArg) + " has debug symbols, but it shouldn't have them in Release mode")
                            return False
                    else:
                        if not 'with debug_info' in output_txt:
                            logger.error("File: " + str(fileArg) + " hasn't debug symbols, but it sould have them in Debug mode")
                            return False
                        
                    logger.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")
             
    return True

def macosAll():
    current_dir = os.getcwd()
    logger = logging.getLogger("BuildSystem")
    
    profiles = ['Release', 'Debug']
    generators = ['Unix Makefiles', 'Xcode']
    compilers = [['gcc', 'g++'], ['clang', 'clang++']]
    cpp_standards = ['17', '20']
    
    for profile in profiles:
        for generator in generators:
            for compiler in compilers:
                for cpp_standard in cpp_standards:
                    logger.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")
                    buf = generator
                    output = 'output_' + profile + '_' + re.sub(' ', '_', generator) + '_' + re.sub(' ', '_', compiler[0]) + '_' + re.sub(' ', '_', compiler[1]) + '_' + cpp_standard
                    
                    cmd = ['python3', 'build.py', '--profile', profile, 
                        '--generator', generator, 
                        '--c_compiler', compiler[0], 
                        '--cxx_compiler', compiler[1], 
                        '--cpp_standard', cpp_standard, 
                        '--run_tests', 
                        '--clean',
                        '--log_output_file', 'log.txt', 
                        '--output',  os.path.join(current_dir, 'output', output)]
                    
                    return_code = Utils.run(cmd, current_dir)
                    if return_code != 0:
                        return False
                        
                    if generator == "Xcode":
                        fileArg = os.path.join(current_dir, 'output', output, 'factorial', 'factorialExeShared', profile, 'FactorialShared')
                    else:
                        fileArg = os.path.join(current_dir, 'output', output, 'factorial', 'factorialExeShared', 'FactorialShared')
                    cmd = ['nm', fileArg]
                    return_code, output_txt = Utils.run(cmd, current_dir, collect_output = True)
                    if return_code != 0:
                        logger.error("Cannot run nm")
                        return False
                        
                    lines = output_txt.count('\n')
                  
                    if profile == 'Release':
                        if lines > 60:
                            logger.error("File: " + str(fileArg) + " has debug symbols, but it shouldn't have them in Release mode")
                            return False
                    else:
                        if lines <= 60:
                            logger.error("File: " + str(fileArg) + " hasn't debug symbols, but it sould have them in Debug mode")
                            return False
                        
                    logger.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")
             
    return True
    

def windowsAll():
    current_dir = os.getcwd()
    logger = logging.getLogger("BuildSystem")
    
    profiles = ['Release', 'Debug']
    configures = [
        {'generator': 'Visual Studio 16 2019', 
         'c_compiler': 'cl', 
         'cxx_compiler': 'cl'}, 
        {'generator': 'MinGW Makefiles', 
         'c_compiler': 'gcc', 
         'cxx_compiler': 'g++'},
        {'generator': 'Ninja', 
         'c_compiler': 'gcc', 
         'cxx_compiler': 'g++'}
         ]

    cpp_standards = ['17', '20']

    for profile in profiles:
        for configure in configures:
            for cpp_standard in cpp_standards:
                logger.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")
                generator = configure['generator']
                c_compiler = configure['c_compiler']
                cxx_compiler = configure['cxx_compiler']
                output = 'output_' + profile + '_' + re.sub(' ', '_', generator) + '_' + re.sub(' ', '_', c_compiler) + '_' + re.sub(' ', '_', cxx_compiler) + '_' + cpp_standard
                
                cmd = ['py', '-3', 'build.py', '--profile', profile, 
                    '--generator',  generator, 
                    '--c_compiler', c_compiler, 
                    '--cxx_compiler', cxx_compiler, 
                    '--cpp_standard', cpp_standard, 
                    '--run_tests', 
                    '--clean',
                    '--log_output_file', 'log.txt', 
                    '--output',  os.path.join(current_dir, 'output', output)]
                
                return_code = Utils.run(cmd, current_dir)
                if return_code != 0:
                    return False
                
                if generator == 'Visual Studio 16 2019':
                    output_exe_dir = os.path.join(current_dir, 'output', output, 'factorial', 'factorialExeShared', profile)
                    if not os.path.isdir(output_exe_dir):
                        logger.error("Output: " + str(output_exe_dir) + " doesn't exist")
                        return False
                        
                    if profile == 'Debug':
                        pdb_file_path = os.path.join(output_exe_dir, 'FactorialShared.pdb')
                        if not os.path.isfile(pdb_file_path):
                            logger.error("Debug file: " + str(output_exe_dir) + " doesn't exist")
                            return False

                logger.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")
            
    return True
    

def main():
    current_dir = os.getcwd()
    logger = logging.getLogger("BuildSystem")
    consoleLoggerhandler = logging.StreamHandler()
    consoleLoggerhandler.setLevel(logging.INFO)
    consoleFormatter = logging.Formatter('%(asctime)s - %(name)s - %(levelname)s - %(message)s')
    consoleLoggerhandler.setFormatter(consoleFormatter)
    logger.addHandler(consoleLoggerhandler)
    logger.setLevel(logging.INFO)
    
    
    if Utils.sysOp().linux:
        res = linuxAll()
        if not res:
            return False;
        res = linuxSanitizerAndDefines()
    elif Utils.sysOp().macos:
        res = macosAll()
        #if not res: # sanitizer not ready
        #    return False;
        #res = linuxSanitizerAndDefines()
    elif Utils.sysOp().windows:
        res = windowsAll()
        
    return res
    
if __name__ == "__main__":
    res = main()
    if res:
        sys.exit(0)
    else:
        sys.exit(1)
