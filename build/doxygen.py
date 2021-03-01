#!/usr/bin/python3

# Author: Marcin Serwach
# License: MIT
# ULR: https://github.com/iblis-ms/python_cmake_build_system
import os

from .utils import Utils

class Doxygen:

    def appendArgParse(self, arg_parser):
        arg_parser.add_argument(
            '-dox',
            '--doxygen',
            action="store_true",
            help='Doxygen: enable'
            )
        arg_parser.add_argument(
            '-dox_only',
            '--run_doxygen_only',
            action="store_true",
            help='Doxygen: enable'
            )
        arg_parser.add_argument(
            '-dox_conf',
            '--doxygen_configuration',
            help='Doxygen: Path to Doxygen configuraiton file.'
            )


        arg_parser.add_argument(
            '-dox_o',
            '--doxygen_output',
            help='Doxygen: Path where doxygen output shall be located.'
            )

    
    def run(self, args):
        if not args.doxygen and not args.run_doxygen_only:
            print("bo run")
            return 0
            
        cmd = ['doxygen', args.doxygen_configuration]
        return_code = Utils.run(cmd, os.getcwd())
        return return_code