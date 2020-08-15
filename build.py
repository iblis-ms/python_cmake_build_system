#!/usr/bin/python3 

# Author: Marcin Serwach
# License: MIT
# ULR: https://github.com/iblis-ms/python_cmake_build_system

import argparse
import os
import shutil
import sys
import build.buildSystem
   
def main():
    build_system = build.buildSystem.BuildSystemHelper()
    arg_parser = build_system.get_argument_parser_items('Test App')
    
    args = arg_parser.parse_args()
    
    current_dir = os.getcwd();
    input_path = os.path.join(current_dir, 'code')
    output_path = os.path.join(current_dir, 'output')
    
    generate_result = build_system.generate(args, input_path, output_path)
    if generate_result == 0:
        build_result = build_system.build(args, output_path)
        return build_result == 0
    return False

if __name__ == "__main__":
    main()

