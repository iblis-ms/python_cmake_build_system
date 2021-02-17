

import os
import shutil


from .utils import Utils
from .sysOp import SysOp

class RunHelper:
    def __init__(self, test_dir_path, output_path):
        self._test_dir_path = test_dir_path
        self._output_path = output_path
        self._current_dir = os.getcwd()
        self._build_script_dir = os.path.join(self._current_dir, '..')

    def clean(self):
        build_script_path = os.path.join(self._test_dir_path, 'build.py')
        if os.path.isfile(build_script_path):
            os.remove(build_script_path)
        build_path = os.path.join(self._test_dir_path, 'build')
        if os.path.isdir(build_path):
            shutil.rmtree(build_path)
        if os.path.isdir(self._output_path):
            shutil.rmtree(self._output_path)
        
    def copyBuildScripts(self):
        self.clean()

        build_script_path_src = os.path.join(self._build_script_dir, 'build.py')
        build_script_path_dest = os.path.join(self._test_dir_path, 'build.py')
        shutil.copyfile(build_script_path_src, build_script_path_dest)

        build_path_src = os.path.join(self._build_script_dir, 'build')
        build_path_dest = os.path.join(self._test_dir_path, 'build')
        shutil.copytree(build_path_src, build_path_dest)


    def run(self, args, collect_output = False, specific_output = False):

        if SysOp().windows:
            cmd = ['py', '-3', 'build.py']
        else:
            cmd = ['python3', 'build.py']
            
        if args is not None:
            cmd.extend(args)
        if specific_output:
            cmd.extend(['--output', self._output_path])
            self.output_specified = True
        else:
            self.output_specified = False

        return_code, output = Utils.run(cmd, self._test_dir_path, collect_output = collect_output)
        
        return return_code, output

    @staticmethod
    def findFile(file_name, dir_path):
        for root, dirs, files in os.walk(dir_path): 
            for file in files: 
                if file == file_name:
                    return os.path.join(root, file)
        return None

    def findExe(self, file_name, find_root = None):
        if SysOp().windows:
            file_name = file_name + '.exe'
            
        root = self.outputPath()
        if find_root is not None:
            root = find_root
        exe_path = RunHelper.findFile(file_name, root)
        if exe_path is not None:
            is_exe = os.access(exe_path, os.X_OK) 
            if is_exe:
                return exe_path
        return None
    
    def outputPath(self):
        output = os.path.join(self._test_dir_path, 'output')
        if self.output_specified:
            output = self._output_path
        return output

    @staticmethod
    def checkIfFileContentIsFileName(file_path):
        f = open(file_path)
        content = f.read()
        f.close()
        file_name = os.path.basename(file_path)
        return content == file_name

    @staticmethod
    def checkIfFileContentIsFileNameRecursive(dir_path):
        number_of_checked_files = 0
        for root, dirs, files in os.walk(dir_path): 
            for file in files: 
                file_path = os.path.join(root, file)
                valid = RunHelper.checkIfFileContentIsFileName(file_path)
                if not valid:
                    return False, number_of_checked_files
                number_of_checked_files = number_of_checked_files +1
        return True, number_of_checked_files
    
    