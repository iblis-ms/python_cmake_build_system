#!/usr/bin/python3

# Author: Marcin Serwach
# License: MIT
# ULR: https://github.com/iblis-ms/python_cmake_build_system

import os

from .utils import Utils
import re

class Benchmark:

    def appendArgParse(self, arg_parser):
        arg_parser.add_argument(
            '-bench',
            '--benchmark',
            action="store_true",
            help='Benchmark: enable'
            )
        arg_parser.add_argument(
            '-bench_regex',
            '--benchmark_regex',
            help='Benchmark: regex'
            )
        
        return arg_parser

    def getCmakeDefines(self, args):
        cmake = []
        if args.gcov:
            cmake.append('-DGBENCHMARK_ENABLE=1')
        
        return cmake

    def afterRunTests(self, args):

        if not args.benchmark:
            return 0
        path_to_list = os.path.join(args.output, 'paths_to_benchmarks.txt')
        if not os.path.isfile(path_to_list):
            return 0
        file_with_list  = open(path_to_list, "r")
        for line in file_with_list:
            line = line.rstrip()
            file_name = os.path.basename(line)

            match_result = True
            if args.benchmark_regex:
                match_result = re.findall(args.benchmark_regex, file_name)
            
            if match_result:
                path_folder = os.path.dirname(line)
                output_file_name = os.path.splitext(file_name)[0]
                output_file_path = os.path.join(path_folder, output_file_name + '_benchmark.txt')

                result_code = Utils.run([line], str(path_folder), output_file_path = output_file_path)
                if result_code != 0:
                    return result_code

        file_with_list.close()
        return 0
        