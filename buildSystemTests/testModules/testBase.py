

import logging
import unittest
import os

import testModules



from parameterized import parameterized
from .utils import Utils
from .sysOp import SysOp
from .runHelper import RunHelper

class TestBase(unittest.TestCase):
    def getTestOutputDir(self):
        return os.path.join(self.getTestDir(), 'output')

    def setUp(self):
        logger = logging.getLogger("BuildSystemTest")
        logger.info("\n\nBEGIN " + self._testMethodName + "\n")

        test_dir_path = self.getTestDir()
        output_path = self.getTestOutputDir()
        self.test = RunHelper(
            test_dir_path = test_dir_path,
            output_path = output_path
        )
        self.test.clean()
        self.test.copyBuildScripts()

    def tearDown(self):
        self.test.clean()

        logger = logging.getLogger("BuildSystemTest")
        logger.info("\n\nFINISH " + self._testMethodName + "\n")
    
class ParameterTestBase(unittest.TestCase):

    def createTestConfigToFolderName(test_config):
        output = f'output_{test_config.generator}_{test_config.c_compiler}_{test_config.cxx_compiler}_{test_config.build_type}_{test_config.cxx_std}'
        return output.replace(" ", "_")
    
    def getTestOutputDir(self, test_config):
        output = ParameterTestBase.createTestConfigToFolderName(test_config)
        return os.path.join(self.getTestDir(), output)

    def setUp(self):
        logger = logging.getLogger("BuildSystemTest")
        logger.info("\n\nBEGIN " + self._testMethodName + "\n")

        
    def setUpWithConfig(self, test_config):
        self._test_config = test_config
        print(f'----------------------------------------------')
        print(f'Generator: {test_config.generator}')
        print(f'C compiler: {test_config.c_compiler}')
        print(f'CXX compiler: {test_config.cxx_compiler}')
        print(f'Build type: {test_config.build_type}')
        print(f'C++ std: {test_config.cxx_std}')
        print(f'Output: {test_config.expected_txt_array}')
        print(f'----------------------------------------------')
        
        test_dir_path = self.getTestDir()
        output_path = self.getTestOutputDir(test_config)
        self.test = RunHelper(
            test_dir_path = test_dir_path,
            output_path = output_path
        )
        self.test.clean()
        self.test.copyBuildScripts()
        
    def runBuild(self, args = None, collect_output = True, clean = True):
        all_args = []

        all_args.extend(
            ['--generator', self._test_config.generator,
            '--profile', self._test_config.build_type,
            '--c_compiler', self._test_config.c_compiler, 
            '--cxx_compiler', self._test_config.cxx_compiler
            ]
        )
        if self._test_config.cxx_std is not None:
            all_args.extend(['--cpp_standard', self._test_config.cxx_std])

        if clean:
            all_args.append('--clean')
        if args is not None:
            all_args.extend(args)
        return self.test.run(all_args, collect_output=collect_output, specific_output = True)
    
    def tearDown(self):
        self.test.clean()

        logger = logging.getLogger("BuildSystemTest")
        logger.info("\n\nFINISH " + self._testMethodName + "\n")

    @staticmethod
    def customName(testcase_func, param_num, param):
        test_config = param[0][0]
        return f"{testcase_func.__name__}_{parameterized.to_safe_name(ParameterTestBase.createTestConfigToFolderName(test_config))}"