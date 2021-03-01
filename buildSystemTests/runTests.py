#!/usr/bin/python3 

from parameterized import parameterized
import unittest
import os
import shutil

import testModules

from testModules.utils import Utils
from testModules.sysOp import SysOp
from testModules.testBase import TestBase
from testModules.testBase import ParameterTestBase
from testModules.testConfig import TestConfig
from testModules.runHelper import RunHelper



import logging
import sys

# pip3 install parameterized
# pip3 install gcovr

class TestSingleExe(TestBase):
    
    def getTestDir(self):
        return os.path.join(os.getcwd(), 'single_exec')

    def test_logOutput(self):
        log_path = os.path.join(self.getTestDir(), 'THIS_IS_LOG.txt')
        if os.path.isfile(log_path):
            os.remove(log_path)
        return_code, output = self.test.run(['--log_output_file' , log_path])
        self.assertEqual(return_code, 0)
        exe_path = self.test.findExe('SingleExec')
        self.assertIsNotNone(exe_path)

        self.assertTrue(os.path.isfile(log_path))
        log_file = open(log_path)
        log_file_content = log_file.read()
        log_file.close()

        self.assertTrue('The C compiler identification is' in log_file_content)
        self.assertTrue('The CXX compiler identification is' in log_file_content)
        
    def test_cleanBuildExe(self):
        return_code, output = self.test.run(None)
        self.assertEqual(return_code, 0)
        exe_path = self.test.findExe('SingleExec')
        self.assertIsNotNone(exe_path)

        file_name = "test_file.txt"
        file_path = os.path.join(self.test.outputPath(), file_name)
        f = open(file_path, "w")
        f.write(file_name)
        f.close()

        self.test.run(['--clean'])

        exist_file = os.path.isfile(file_path)
        self.assertFalse(exist_file)


class ParameterTestSingleExe(ParameterTestBase):

    def getTestDir(self):
        return os.path.join(os.getcwd(), 'single_exec')
    
    @parameterized.expand(TestConfig.createSingleTestData(), name_func=ParameterTestBase.customName)
    def test_simpleBuildExe(self, test_config):
        super().setUpWithConfig(test_config)
        return_code, output = self.runBuild()
        self.assertEqual(return_code, 0)
        exe_path = self.test.findExe('SingleExec')
        self.assertIsNotNone(exe_path)


    @parameterized.expand(TestConfig.createSingleTestData(), name_func=ParameterTestBase.customName)
    def test_generateOnly(self, test_config):
        super().setUpWithConfig(test_config)

        return_code, output = self.runBuild(['--generate_only'])
        self.assertEqual(return_code, 0)
        exe_path = self.test.findExe('SingleExec')
        self.assertIsNone(exe_path)

    @parameterized.expand(TestConfig.createSingleTestData(), name_func=ParameterTestBase.customName)
    def test_definePass(self, test_config):
        super().setUpWithConfig(test_config)

        return_code, output = self.runBuild(['--c_definitions', 'THIS_IS_DEFINE', 'THIS_IS_DEFINE_VALUE=1'])
        self.assertEqual(return_code, 0)

        exe_path = self.test.findExe('SingleExec')
        self.assertIsNotNone(exe_path)
        return_code, output_txt = Utils.run(
            [ exe_path],
            working_dir = os.getcwd(),
            collect_output = True)
        self.assertEqual(return_code, 0)
        self.assertIn('THIS IS simple_exec', output_txt)
        self.assertIn('THIS_IS_DEFINE_VALUE: 1', output_txt)

        self.test.run(['--clean'])
        exe_path = self.test.findExe('SingleExec')
        self.assertIsNotNone(exe_path)
        return_code, output_txt = Utils.run(
            [ exe_path],
            working_dir = os.getcwd(),
            collect_output = True)
        self.assertEqual(return_code, 0)
        self.assertIn('THIS IS simple_exec', output_txt)
        self.assertNotIn('THIS_IS_DEFINE_VALUE: 1', output_txt)
     

class TestCMakeDefine(TestBase):

    def getTestDir(self):
        return os.path.join(os.getcwd(), 'cmake_defines')

    def test_customOutput(self):
        return_code, output = self.test.run(['--cmake_definitions', 'THIS_IS_CMAKE_DEFINE=1', 'THIS_IS_ANOTHER_CMAKE_DEFINE=abc'])
        self.assertEqual(return_code, 0)

        test_file_path = os.path.join(self.test.outputPath(), 'output_file.txt')
        self.assertTrue(os.path.isfile(test_file_path))

        f = open(test_file_path)
        content = f.read()
        f.close()
        self.assertEqual(content, "value=abc")
        
class TestCompilerProfileExe(ParameterTestBase):
    
    def getTestDir(self):
        return os.path.join(os.getcwd(), 'compiler_profile')
  
    @parameterized.expand(TestConfig.createSingleTestData(True), name_func=ParameterTestBase.customName)
    def test_generatorsCompilerProfilesStandards(self, test_config):
        super().setUpWithConfig(test_config)
        expected_text = f"{test_config.generator} {test_config.cxx_compiler} {test_config.build_type} C++{test_config.cxx_std}"

        return_code, output = self.runBuild(['--clean'])
        self.assertEqual(return_code, 0)
        exe_path = self.test.findExe('CompilerProfileExe')
        self.assertIsNotNone(exe_path, 'not found: ' + expected_text)
        return_code, output_txt = Utils.run(
            [exe_path],
            working_dir = os.getcwd(),
            collect_output = True)
        self.assertEqual(return_code, 0)
        self.assertIn(test_config.build_type, output_txt, 'Build type not found: ' + expected_text)
        self.assertIn(test_config.cxx_compiler, output_txt, 'DXX compiler not found: ' + expected_text)
        self.assertIn(test_config.cxx_std, output_txt, 'Standard C++ not found: ' + expected_text)
  
class TestMultitargetProject(ParameterTestBase):
    
    def getTestDir(self):
        return os.path.join(os.getcwd(), 'multi_targets_project')

    @parameterized.expand(TestConfig.createSingleTestData(False), name_func=ParameterTestBase.customName)
    def test_buildWithResources(self, test_config):
        super().setUpWithConfig(test_config)

        return_code, output = self.runBuild()
        self.assertEqual(return_code, 0)

        exe1_path = self.test.findExe('ExeTarget1')
        self.assertIsNotNone(exe1_path)
        exe2_path = self.test.findExe('ExeTarget2')
        self.assertIsNotNone(exe2_path)

        dir_exe1_path = os.path.dirname(exe1_path)
        dir_exe2_path = os.path.dirname(exe2_path)

        exe1_folder_names_copy_to_exe_dir = ['res_exe1_a', 'res_interface1_a', 'res_interface2_a', 'res_interface3_a', 'res_shared1_a', 'res_shared2_a']
        for folder_name in exe1_folder_names_copy_to_exe_dir:
            valid_content, number_of_checked_files = RunHelper.checkIfFileContentIsFileNameRecursive(os.path.join(dir_exe1_path, folder_name))
            self.assertTrue(valid_content)
            self.assertEqual(number_of_checked_files, 4)

        exe2_folder_names_copy_to_exe_dir = ['res_exe2_a', 'res_interface1_a', 'res_interface2_a', 'res_interface3_a', 'res_interface4_a', 'res_static1_a', 'res_static2_a', 'res_static3_a']
        for folder_name in exe2_folder_names_copy_to_exe_dir:
            valid_content, number_of_checked_files = RunHelper.checkIfFileContentIsFileNameRecursive(os.path.join(dir_exe2_path, folder_name))
            self.assertTrue(valid_content)
            self.assertEqual(number_of_checked_files, 4)

        res_data = [
            'SharedTarget1',
            'ExeTarget1',
            'ExeTarget2',
            'InterfaceTarget1',
            'InterfaceTarget2',
            'InterfaceTarget3', 
            'InterfaceTarget4',
            'SharedTarget1',
            'SharedTarget2', 
            'StaticTarget1', 
            'StaticTarget2', 
            'StaticTarget3',
            ]
        
        for res in res_data:
            folder_path = os.path.join(self.test.outputPath(), res, 'res')
            valid_content, number_of_checked_files = RunHelper.checkIfFileContentIsFileNameRecursive(folder_path)
            self.assertTrue(valid_content)
            self.assertEqual(number_of_checked_files, 5, str(folder_path))
       
    @parameterized.expand(TestConfig.createSingleTestData(False), name_func=ParameterTestBase.customName)
    def test_selectiveBuild(self, test_config):
        super().setUpWithConfig(test_config)

        return_code, output = self.runBuild(['--target', 'ExeTarget1'])
        self.assertEqual(return_code, 0)
        exe1_path = self.test.findExe('ExeTarget1')
        self.assertIsNotNone(exe1_path)
        exe2_path = self.test.findExe('ExeTarget2')
        self.assertIsNone(exe2_path)
        

class ParameterTestBenchmarksTest(ParameterTestBase):

    def getTestDir(self):
        return os.path.join(os.getcwd(), 'tests_benchmarks')

    @parameterized.expand(TestConfig.createSingleTestData(False, False), name_func=ParameterTestBase.customName)
    def test_buildAndRunTestsBenchmarks(self, test_config):

        super().setUpWithConfig(test_config)

        return_code, output = self.runBuild(['--run_tests', '--run_benchmarks'])

        self.assertEqual(return_code, 0)
        
        exe_path = self.test.findExe('FactorialIterativeBenchmark')
        self.assertIsNotNone(exe_path, "Failed: " + str(self.test.outputPath()))
        exe_path = self.test.findExe('FactorialRecursiveBenchmark')
        self.assertIsNotNone(exe_path, "Failed: " + str(self.test.outputPath()))
        exe_path = self.test.findExe('FactorialIterativeTest')
        self.assertIsNotNone(exe_path, "Failed: " + str(self.test.outputPath()))
        exe_path = self.test.findExe('FactorialRecursiveTest')
        self.assertIsNotNone(exe_path, "Failed: " + str(self.test.outputPath()))

        self.assertTrue('Benchmark_factorial_iterative/2' in output, 'FactorialIterativeBenchmark wasn\'t run. ' + str(self.test.outputPath()))
        self.assertTrue('Benchmark_factorial_recursive/2' in output, 'FactorialRecursiveBenchmark wasn\'t run. ' + str(self.test.outputPath()))
        self.assertTrue('Factorial.Recursive0' in output, 'FactorialRecursiveTest wasn\'t run. ' + str(self.test.outputPath()))
        self.assertTrue('Factorial.Iteative0' in output, 'FactorialIterativeTest wasn\'t run. ' + str(self.test.outputPath()))
      
    @parameterized.expand(TestConfig.createSingleTestData(False, False), name_func=ParameterTestBase.customName)
    def test_buildAndRunBenchmarks(self, test_config):
        super().setUpWithConfig(test_config)

        return_code, output = self.runBuild(['--run_benchmarks'])

        self.assertEqual(return_code, 0)
        
        exe_path = self.test.findExe('FactorialIterativeBenchmark')
        self.assertIsNotNone(exe_path, "Failed: " + str(self.test.outputPath()))
        exe_path = self.test.findExe('FactorialRecursiveBenchmark')
        self.assertIsNotNone(exe_path, "Failed: " + str(self.test.outputPath()))
        exe_path = self.test.findExe('FactorialIterativeTest')
        self.assertIsNotNone(exe_path, "Failed: " + str(self.test.outputPath()))
        exe_path = self.test.findExe('FactorialRecursiveTest')
        self.assertIsNotNone(exe_path, "Failed: " + str(self.test.outputPath()))

        self.assertTrue('Benchmark_factorial_iterative/2' in output, 'FactorialIterativeBenchmark wasn\'t run. ' + str(self.test.outputPath()))
        self.assertTrue('Benchmark_factorial_recursive/2' in output, 'FactorialRecursiveBenchmark wasn\'t run. ' + str(self.test.outputPath()))
        self.assertFalse('Factorial.Recursive0' in output, 'FactorialRecursiveTest wasn\'t run. ' + str(self.test.outputPath()))
        self.assertFalse('Factorial.Iteative0' in output, 'FactorialIterativeTest wasn\'t run. ' + str(self.test.outputPath()))


    @parameterized.expand(TestConfig.createSingleTestData(False, False), name_func=ParameterTestBase.customName)
    def test_buildAndRunTests(self, test_config):
        super().setUpWithConfig(test_config)
        
        return_code, output = self.runBuild(['--run_tests'])

        self.assertEqual(return_code, 0)
        
        exe_path = self.test.findExe('FactorialIterativeBenchmark')
        self.assertIsNotNone(exe_path, "Failed: " + str(self.test.outputPath()))
        exe_path = self.test.findExe('FactorialRecursiveBenchmark')
        self.assertIsNotNone(exe_path, "Failed: " + str(self.test.outputPath()))
        exe_path = self.test.findExe('FactorialIterativeTest')
        self.assertIsNotNone(exe_path, "Failed: " + str(self.test.outputPath()))
        exe_path = self.test.findExe('FactorialRecursiveTest')
        self.assertIsNotNone(exe_path, "Failed: " + str(self.test.outputPath()))

        self.assertFalse('Benchmark_factorial_iterative/2' in output, 'FactorialIterativeBenchmark was run. ' + str(self.test.outputPath()))
        self.assertFalse('Benchmark_factorial_recursive/2' in output, 'FactorialRecursiveBenchmark was run. ' + str(self.test.outputPath()))
        self.assertTrue('Factorial.Recursive0' in output, 'FactorialRecursiveTest wasn\'t run. ' + str(self.test.outputPath()))
        self.assertTrue('Factorial.Iteative0' in output, 'FactorialIterativeTest wasn\'t run. ' + str(self.test.outputPath()))

    @parameterized.expand(TestConfig.createSingleTestData(False, False), name_func=ParameterTestBase.customName)
    def test_buildAndRunTestsFilter(self, test_config):
        super().setUpWithConfig(test_config)

        return_code, output = self.runBuild(['--run_tests', '--gtest_filter', 'Factorial.Iteative0'])

        self.assertEqual(return_code, 0)
        
        exe_path = self.test.findExe('FactorialIterativeBenchmark')
        self.assertIsNotNone(exe_path, "Failed: " + str(self.test.outputPath()))
        exe_path = self.test.findExe('FactorialRecursiveBenchmark')
        self.assertIsNotNone(exe_path, "Failed: " + str(self.test.outputPath()))
        exe_path = self.test.findExe('FactorialIterativeTest')
        self.assertIsNotNone(exe_path, "Failed: " + str(self.test.outputPath()))
        exe_path = self.test.findExe('FactorialRecursiveTest')
        self.assertIsNotNone(exe_path, "Failed: " + str(self.test.outputPath()))

        self.assertFalse('Benchmark_factorial_iterative/2' in output, 'FactorialIterativeBenchmark was run. ' + str(self.test.outputPath()))
        self.assertFalse('Benchmark_factorial_recursive/2' in output, 'FactorialRecursiveBenchmark was run. ' + str(self.test.outputPath()))
        self.assertFalse('Factorial.Recursive0' in output, 'FactorialRecursiveTest was run. ' + str(self.test.outputPath()))
        self.assertFalse('Factorial.Recursive3' in output, 'FactorialRecursiveTest was run. ' + str(self.test.outputPath()))
        self.assertTrue('Factorial.Iteative0' in output, 'FactorialIterativeTest wasn\'t run. ' + str(self.test.outputPath()))
        self.assertFalse('Factorial.Iteative3' in output, 'FactorialIterativeTest was run. ' + str(self.test.outputPath()))
        

    @parameterized.expand(TestConfig.createSingleTestData(False, False), name_func=ParameterTestBase.customName)
    def test_buildAndRunBenchmarksFilter(self, test_config):
        super().setUpWithConfig(test_config)

        return_code, output = self.runBuild(['--run_benchmarks', '--benchmark_filter', 'Benchmark_factorial_iterative'])

        self.assertEqual(return_code, 0)
        
        exe_path = self.test.findExe('FactorialIterativeBenchmark')
        self.assertIsNotNone(exe_path, "Failed: " + str(self.test.outputPath()))
        exe_path = self.test.findExe('FactorialRecursiveBenchmark')
        self.assertIsNotNone(exe_path, "Failed: " + str(self.test.outputPath()))
        exe_path = self.test.findExe('FactorialIterativeTest')
        self.assertIsNotNone(exe_path, "Failed: " + str(self.test.outputPath()))
        exe_path = self.test.findExe('FactorialRecursiveTest')
        self.assertIsNotNone(exe_path, "Failed: " + str(self.test.outputPath()))

        self.assertTrue('Benchmark_factorial_iterative/2' in output, 'FactorialIterativeBenchmark wasn\'t run. ' + str(self.test.outputPath()))
        self.assertFalse('Benchmark_factorial_recursive/2' in output, 'FactorialRecursiveBenchmark wasn\'t run. ' + str(self.test.outputPath()))
        self.assertFalse('Factorial.Recursive0' in output, 'FactorialRecursiveTest wasn\'t run. ' + str(self.test.outputPath()))
        self.assertFalse('Factorial.Iteative0' in output, 'FactorialIterativeTest wasn\'t run. ' + str(self.test.outputPath()))

    @parameterized.expand(TestConfig.createSingleTestData(False, False), name_func=ParameterTestBase.customName)
    def test_buildTestIncludeTarget(self, test_config):
        super().setUpWithConfig(test_config)

        return_code, output = self.runBuild(['--run_tests', '--test_include', 'FactorialIterativeTest'])

        self.assertEqual(return_code, 0)

        exe_path = self.test.findExe('FactorialIterativeBenchmark')
        self.assertIsNotNone(exe_path, "Failed: " + str(self.test.outputPath()))
        exe_path = self.test.findExe('FactorialRecursiveBenchmark')
        self.assertIsNotNone(exe_path, "Failed: " + str(self.test.outputPath()))
        exe_path = self.test.findExe('FactorialIterativeTest')
        self.assertIsNotNone(exe_path, "Failed: " + str(self.test.outputPath()))
        exe_path = self.test.findExe('FactorialRecursiveTest')
        self.assertIsNone(exe_path, 'FactorialRecursiveTest was built but it shouldn\'t.')

        self.assertFalse('Factorial.Recursive0' in output, 'FactorialRecursiveTest was run. ' + str(self.test.outputPath()))
        self.assertTrue('Factorial.Iteative0' in output, 'FactorialIterativeTest wasn\'t run. ' + str(self.test.outputPath()))

    @parameterized.expand(TestConfig.createSingleTestData(False, False), name_func=ParameterTestBase.customName)
    def test_buildTestExcludeTarget(self, test_config):
        super().setUpWithConfig(test_config)

        return_code, output = self.runBuild(['--run_tests', '--test_exclude', 'FactorialIterativeTest'])

        self.assertEqual(return_code, 0)

        exe_path = self.test.findExe('FactorialIterativeBenchmark')
        self.assertIsNotNone(exe_path, "Failed: " + str(self.test.outputPath()))
        exe_path = self.test.findExe('FactorialRecursiveBenchmark')
        self.assertIsNotNone(exe_path, "Failed: " + str(self.test.outputPath()))
        exe_path = self.test.findExe('FactorialIterativeTest')
        self.assertIsNone(exe_path, 'FactorialIterativeTest was built but it shouldn\'t.')
        exe_path = self.test.findExe('FactorialRecursiveTest')
        self.assertIsNotNone(exe_path, "Failed: " + str(self.test.outputPath()))

        self.assertTrue('Factorial.Recursive0' in output, 'FactorialRecursiveTest was run. ' + str(self.test.outputPath()))
        self.assertFalse('Factorial.Iteative0' in output, 'FactorialIterativeTest wasn\'t run. ' + str(self.test.outputPath()))
        
    @parameterized.expand(TestConfig.createSingleTestData(False, False), name_func=ParameterTestBase.customName)
    def test_buildBenchmarkExcludeTarget(self, test_config):
        super().setUpWithConfig(test_config)

        return_code, output = self.runBuild(['--run_benchmarks', '--benchmark_exclude', 'FactorialIterativeBenchmark'])

        self.assertEqual(return_code, 0)

        exe_path = self.test.findExe('FactorialIterativeBenchmark')
        self.assertIsNone(exe_path, 'FactorialIterativeBenchmark was built but it shouldn\'t.')
        exe_path = self.test.findExe('FactorialRecursiveBenchmark')
        self.assertIsNotNone(exe_path, "Failed: " + str(self.test.outputPath()))
        exe_path = self.test.findExe('FactorialIterativeTest')
        self.assertIsNotNone(exe_path, "Failed: " + str(self.test.outputPath()))
        exe_path = self.test.findExe('FactorialRecursiveTest')
        self.assertIsNotNone(exe_path, "Failed: " + str(self.test.outputPath()))

        self.assertFalse('Benchmark_factorial_iterative/2' in output, 'FactorialIterativeBenchmark wasn\'t run. ' + str(self.test.outputPath()))
        self.assertTrue('Benchmark_factorial_recursive/2' in output, 'FactorialRecursiveBenchmark wasn\'t run. ' + str(self.test.outputPath()))
 
    @parameterized.expand(TestConfig.createSingleTestData(False, False), name_func=ParameterTestBase.customName)
    def test_buildBenchmarkIncludeTarget(self, test_config):
        super().setUpWithConfig(test_config)

        return_code, output = self.runBuild(['--run_benchmarks', '--benchmark_include', 'FactorialIterativeBenchmark'])

        self.assertEqual(return_code, 0)

        exe_path = self.test.findExe('FactorialIterativeBenchmark')
        self.assertIsNotNone(exe_path, "Failed: " + str(self.test.outputPath()))
        exe_path = self.test.findExe('FactorialRecursiveBenchmark')
        self.assertIsNone(exe_path, 'FactorialRecursiveBenchmark was built but it shouldn\'t.')
        exe_path = self.test.findExe('FactorialIterativeTest')
        self.assertIsNotNone(exe_path, "Failed: " + str(self.test.outputPath()))
        exe_path = self.test.findExe('FactorialRecursiveTest')
        self.assertIsNotNone(exe_path, "Failed: " + str(self.test.outputPath()))

        self.assertTrue('Benchmark_factorial_iterative/2' in output, 'FactorialIterativeBenchmark wasn\'t run. ' + str(self.test.outputPath()))
        self.assertFalse('Benchmark_factorial_recursive/2' in output, 'FactorialRecursiveBenchmark wasn\'t run. ' + str(self.test.outputPath()))
    
    @parameterized.expand(TestConfig.createSingleTestData(False, False), name_func=ParameterTestBase.customName)
    def test_runTestsOnly(self, test_config):
        super().setUpWithConfig(test_config)

        return_code, output = self.runBuild()

        self.assertEqual(return_code, 0)
        
        exe_path = self.test.findExe('FactorialIterativeBenchmark')
        self.assertIsNotNone(exe_path, "Failed: " + str(self.test.outputPath()))
        exe_path = self.test.findExe('FactorialRecursiveBenchmark')
        self.assertIsNotNone(exe_path, "Failed: " + str(self.test.outputPath()))
        exe_path = self.test.findExe('FactorialIterativeTest')
        self.assertIsNotNone(exe_path, "Failed: " + str(self.test.outputPath()))
        exe_path = self.test.findExe('FactorialRecursiveTest')
        self.assertIsNotNone(exe_path, "Failed: " + str(self.test.outputPath()))

        return_code, output = self.runBuild(['--run_tests_only'], clean=False)

        self.assertEqual(return_code, 0)

        self.assertFalse('[100%] Built target FactorialRecursiveBenchmark' in output)

        self.assertFalse('Benchmark_factorial_iterative/2' in output, 'FactorialIterativeBenchmark was run. ' + str(self.test.outputPath()))
        self.assertFalse('Benchmark_factorial_recursive/2' in output, 'FactorialRecursiveBenchmark was run. ' + str(self.test.outputPath()))
        self.assertTrue('Factorial.Recursive0' in output, 'FactorialRecursiveTest wasn\'t run. ' + str(self.test.outputPath()))
        self.assertTrue('Factorial.Iteative0' in output, 'FactorialIterativeTest wasn\'t run. ' + str(self.test.outputPath()))
        
    @parameterized.expand(TestConfig.createSingleTestData(False, False), name_func=ParameterTestBase.customName)
    def test_runBenchmarkOnly(self, test_config):
        super().setUpWithConfig(test_config)

        return_code, output = self.runBuild()

        self.assertEqual(return_code, 0)
        
        exe_path = self.test.findExe('FactorialIterativeBenchmark')
        self.assertIsNotNone(exe_path, "Failed: " + str(self.test.outputPath()))
        exe_path = self.test.findExe('FactorialRecursiveBenchmark')
        self.assertIsNotNone(exe_path, "Failed: " + str(self.test.outputPath()))
        exe_path = self.test.findExe('FactorialIterativeTest')
        self.assertIsNotNone(exe_path, "Failed: " + str(self.test.outputPath()))
        exe_path = self.test.findExe('FactorialRecursiveTest')
        self.assertIsNotNone(exe_path, "Failed: " + str(self.test.outputPath()))

        return_code, output = self.runBuild(['--run_benchmarks_only'], clean=False)

        self.assertEqual(return_code, 0)

        self.assertFalse('[100%] Built target FactorialRecursiveBenchmark' in output)
        
        self.assertTrue('Benchmark_factorial_iterative/2' in output, 'FactorialIterativeBenchmark was run. ' + str(self.test.outputPath()))
        self.assertTrue('Benchmark_factorial_recursive/2' in output, 'FactorialRecursiveBenchmark was run. ' + str(self.test.outputPath()))
        self.assertFalse('Factorial.Recursive0' in output, 'FactorialRecursiveTest wasn\'t run. ' + str(self.test.outputPath()))
        self.assertFalse('Factorial.Iteative0' in output, 'FactorialIterativeTest wasn\'t run. ' + str(self.test.outputPath()))
     

class TestBenchmarksTest(TestBase):

    def getTestDir(self):
        return os.path.join(os.getcwd(), 'tests_benchmarks')
    
    @unittest.skipIf(SysOp().linux is not None or SysOp().windows is not None, "Only for Linux")
    def test_buildAndRunTestsCoverage(self):
        args = ['--run_tests', 
             '--gcov', 
             '--c_compiler', 'gcc', 
             '--cxx_compiler', 'g++']
        if SysOp().windows:
            args.extend(['--generator', 'MinGW Makefiles'])
            
        return_code, output = self.test.run(
            args, 
            collect_output = True, 
            specific_output = True)
        self.assertEqual(return_code, 0)
        
        exe_path = self.test.findExe('FactorialIterativeBenchmark')
        self.assertIsNotNone(exe_path)
        exe_path = self.test.findExe('FactorialRecursiveBenchmark')
        self.assertIsNotNone(exe_path)
        exe_path = self.test.findExe('FactorialIterativeTest')
        self.assertIsNotNone(exe_path)
        exe_path = self.test.findExe('FactorialRecursiveTest')
        self.assertIsNotNone(exe_path)

        self.assertFalse('Benchmark_factorial_iterative/2' in output, 'FactorialIterativeBenchmark was run. ')
        self.assertFalse('Benchmark_factorial_recursive/2' in output, 'FactorialRecursiveBenchmark was run. ')
        self.assertTrue('Factorial.Recursive0' in output, 'FactorialRecursiveTest wasn\'t run. ')
        self.assertTrue('Factorial.Iteative0' in output, 'FactorialIterativeTest wasn\'t run. ')

        coverage_dir = os.path.join(self.getTestOutputDir(), 'code_coverage')
        
        self.assertTrue(os.path.isdir(coverage_dir))
        index_path = os.path.join(coverage_dir, 'index.html')
        self.assertTrue(os.path.isfile(index_path))

        index_file = open(index_path)
        index_file_content = index_file.read()
        index_file.close()
        self.assertTrue("Factorial.cpp" in index_file_content)
        self.assertTrue("9 / 9" in index_file_content)
        self.assertTrue("4 / 4" in index_file_content)
        self.assertTrue("Lines" in index_file_content)
        self.assertTrue("Branches" in index_file_content)    
        
        
class TestSanitizerIssue(TestBase):
    
    def getTestDir(self):
        return os.path.join(os.getcwd(), 'sanitizers_issues')

    @unittest.skipIf(SysOp().windows is not None, "Dr memory for windows")
    def test_sanitizersDrMemory(self): 
        return_code, output = self.test.run(
            ['--generator', 'MinGW Makefiles',
             '--run_tests', 
             '--sanitizer', 'dr_memory'], 
            collect_output = True, 
            specific_output = True)
        self.assertEqual(return_code, 0)
        
        exe_path = self.test.findExe('SanitizersIssues')
        self.assertIsNotNone(exe_path)

        self.assertTrue('REACHABLE LEAK 2' in output)
        self.assertTrue('INVALID HEAP ARGUMENT' in output)

    @unittest.skipIf(SysOp().linux is not None, "Only for Linux")
    def test_sanitizersValgrind(self):
        return_code, output = self.test.run(
            ['--run_tests', '--sanitizer', 'valgrind'], 
            collect_output = True)
        self.assertEqual(return_code, 0)
        
        exe_path = self.test.findExe('SanitizersIssues')
        self.assertIsNotNone(exe_path)

        self.assertTrue('Conditional jump or move depends on uninitialised value' in output)
        self.assertTrue('Use of uninitialised value of size' in output)
        self.assertTrue('Mismatched free() / delete / delete []' in output)
        
    @unittest.skipIf(SysOp().linux is not None, "Only for Linux")
    def test_sanitizersClangMemory(self):
        return_code, output = self.test.run([
            '--run_tests', 
            '--sanitizer', 'memory_sanitizer',
            '--c_compiler', 'clang',
            '--cxx_compiler', 'clang++'], 
            collect_output = True, 
            specific_output = True)
        self.assertEqual(return_code, 0)
        
        exe_path = self.test.findExe('SanitizersIssues')
        self.assertIsNotNone(exe_path)

        self.assertTrue('Uninitialized value was created by an allocation of \'index\' in the stack frame of function \'main\'' in output)

    @unittest.skipIf(SysOp().linux is not None, "Only for Linux")
    def test_sanitizersClangAddress(self):
        return_code, output = self.test.run([
            '--run_tests', 
            '--sanitizer', 'address_sanitizer',
            '--c_compiler', 'clang',
            '--cxx_compiler', 'clang++'], 
            collect_output = True)
        self.assertEqual(return_code, 0)
        
        exe_path = self.test.findExe('SanitizersIssues')
        self.assertIsNotNone(exe_path)

        self.assertTrue('AddressSanitizer: stack-buffer-overflow on address' in output)

    @unittest.skipIf(SysOp().linux is not None, "Only for Linux")
    def test_sanitizersClangUndefinedBehavior(self):
        return_code, output = self.test.run([
            '--run_tests', 
            '--sanitizer', 'undefined_behavior_sanitizer',
            '--c_compiler', 'clang',
            '--cxx_compiler', 'clang++'], 
            collect_output = True)
        self.assertEqual(return_code, 0)
        
        exe_path = self.test.findExe('SanitizersIssues')
        self.assertIsNotNone(exe_path)

        self.assertTrue('UndefinedBehaviorSanitizer: ' in output)

class TestDoxygen(TestBase):
    
    def getTestDir(self):
        return os.path.join(os.getcwd(), 'multi_targets_project')

    def test_doxygen(self):
        output_dox = os.path.join(self.getTestDir(), 'output_dox')
        shutil.rmtree(output_dox, ignore_errors=True)
        return_code, output = self.test.run([
            '-dox_only', 
            '--doxygen_configuration', os.path.join(self.getTestDir(), 'Doxyfile_config')], 
            collect_output = True)
        doxygen_html = os.path.join(output_dox, 'html', 'index.html')
        self.assertTrue(os.path.isfile(doxygen_html))
        self.assertEqual(return_code, 0)



def setupLogger():
    logger = logging.getLogger("BuildSystemTest")
    consoleLoggerhandler = logging.StreamHandler()
    consoleLoggerhandler.setLevel(logging.INFO)
    consoleFormatter = logging.Formatter('%(asctime)s - %(name)s - %(levelname)s - %(message)s')
    consoleLoggerhandler.setFormatter(consoleFormatter)
    logger.addHandler(consoleLoggerhandler)
    logger.setLevel(logging.INFO)
    
    fileLoggerhandler = logging.FileHandler(os.path.join(os.getcwd(), 'output.txt'))
    fileLoggerhandler.setLevel(logging.INFO)
    fileFormatter = logging.Formatter('%(asctime)s - %(name)s - %(levelname)s - %(message)s')
    fileLoggerhandler.setFormatter(fileFormatter)
    logger.addHandler(fileLoggerhandler)

def main():
    setupLogger()
    unittest.main()

if __name__ == "__main__":
    main()


