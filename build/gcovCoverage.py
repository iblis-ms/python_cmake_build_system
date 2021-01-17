#!/usr/bin/python3

# Author: Marcin Serwach
# License: MIT
# ULR: https://github.com/iblis-ms/python_cmake_build_system

import os

from .utils import Utils

class GCovCoverage:

    def appendArgParse(self, arg_parser):
        arg_parser.add_argument(
            '-gcov',
            '--gcov',
            action="store_true",
            help='GCov: enable'
            )
        arg_parser.add_argument(
            '-gcov_p_t',
            '--gcov_per_target',
            action="store_true",
            help='GCov: TODO: show code coverage per target not entire project'
            )
        arg_parser.add_argument(
            '-gcov_conf',
            '--gcov_config_file',
            help='GCov: Path to configuration file'
            )
        arg_parser.add_argument(
            '-gcov_o',
            '--gcov_output',
            help='GCov: output path'
            )
        
        return arg_parser

    def getCmakeDefines(self, args):
        cmake = []
        if args.gcov:
            cmake.append('-DGCOV_ENABLE=1')
        if not args.gcov_config_file:
            args.gcov_config_file = os.path.join(args.output, "gcov_config.txt")
        cmake.append('-DGCOV_CONF_PATH=' + str(args.gcov_config_file))
            
        if not args.gcov_output:
            folders = os.path.join(args.output, "code_ceverage")
            os.makedirs(folders)
            args.gcov_output = os.path.join(folders, "index.html")

        cmake.append('-DGCOV_OUTPUT_PATH=' + str(args.gcov_output))
        
        return cmake

    def afterRunTests(self, args):
      #  cmd = ['gcovr', '--html', '--html-details' index.html]
        cmd = ['gcovr', '--config', args.gcov_config_file]
        return_code = Utils.run(cmd, args.output)
        return return_code
        #gcovr -r . --html --html-details index.html