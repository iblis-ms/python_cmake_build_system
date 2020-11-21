#!/usr/bin/python3 

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
    
    cmd = ['./build.py', '--profile', profile, 
        '--generator', generator, 
        '--c_compiler', compiler[0], 
        '--cxx_compiler', compiler[1], 
        '--cpp_standard', cpp_standard, 
        '--run_tests', 
        '--clean',
        '--log_output_file', 'log.txt', 
        '--output',  os.path.join(current_dir, output),
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
                    
                    cmd = ['./build.py', '--profile', profile, 
                        '--generator', generator, 
                        '--c_compiler', compiler[0], 
                        '--cxx_compiler', compiler[1], 
                        '--cpp_standard', cpp_standard, 
                        '--run_tests', 
                        '--log_output_file', 'log.txt', 
                        '--output',  os.path.join(current_dir, output)]
                    
                    return_code = Utils.run(cmd, current_dir)
                    if return_code != 0:
                        return False
                        
                    
                    fileArg = os.path.join(current_dir, output, 'factorial', 'factorialExeShared', 'FactorialShared')
                    cmd = ['file', fileArg]
                    return_code, output_txt = Utils.run(cmd, current_dir, collect_output = True)
                    if return_code != 0:
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

def main():
    current_dir = os.getcwd()
    logger = logging.getLogger("BuildSystem")
    consoleLoggerhandler = logging.StreamHandler()
    consoleLoggerhandler.setLevel(logging.INFO)
    consoleFormatter = logging.Formatter('%(asctime)s - %(name)s - %(levelname)s - %(message)s')
    consoleLoggerhandler.setFormatter(consoleFormatter)
    logger.addHandler(consoleLoggerhandler)
    logger.setLevel(logging.INFO)
    
    res = linuxAll()
    if not res:
        return False;
    res = linuxSanitizerAndDefines()
    
    return res
    
if __name__ == "__main__":
    res = main()
    if res:
        sys.exit(0)
    else:
        sys.exit(1)
