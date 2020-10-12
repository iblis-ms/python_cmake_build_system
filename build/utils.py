#!/usr/bin/python3

# Author: Marcin Serwach
# License: MIT
# ULR: https://github.com/iblis-ms/python_cmake_build_system

import os
import subprocess
from builtins import staticmethod
import sys
import requests
import logging
        
from  .sysOp import SysOp

class Utils:
    """
    Class that helps running CMake.
    """

                
                
    @staticmethod
    def sysOp():
        if not hasattr(Utils, 'sysop'):
            Utils.sysop = SysOp()
        return Utils.sysop
            
    @staticmethod
    def downloadScript(url, output_path):
        response = requests.get(url, allow_redirects=True)
        if response.status_code != 200:
            logging.error('Downloading ' + str(url) + ' to ' + str(output_path) + ' FAILED')
            return False

        logging.info('Downloading ' + str(url) + ' to ' + str(output_path))
        open(output_path, 'wb').write(response.content)
        return True
            
    @staticmethod
    def run(cmd, working_dir, env = None):
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
        if Utils.sysOp().windows:
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

        
