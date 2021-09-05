#!/usr/bin/python3 

# Author: Marcin Serwach
# License: MIT
# ULR: https://github.com/iblis-ms/python_cmake_build_system

import build.buildSystem
import sys

def main():
    build_system = build.buildSystem.BuildSystem()
    build_ok = build_system.simpleRun('Test App')
    sys.exit(not build_ok)

if __name__ == "__main__":
    main()

