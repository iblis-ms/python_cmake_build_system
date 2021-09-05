
from .sysOp import SysOp

class TestConfig:
    class TestConfigData:
        def __init__(self, generator, c_compiler, cxx_compiler, build_type, cxx_std, expected_txt_array):
            self.generator = generator
            self.c_compiler = c_compiler
            self.cxx_compiler = cxx_compiler
            self.build_type = build_type
            self.cxx_std = cxx_std
            self.expected_txt_array = expected_txt_array
    
    class ConfigDataInput:
        def __init__(self, c_compiler, cxx_compiler, expected_txt_array):
            self.c_compiler = c_compiler
            self.cxx_compiler = cxx_compiler
            self.expected_txt_array = expected_txt_array

    @staticmethod
    def __createConfigData():
        TestConfig.config_data_input_gcc = TestConfig.ConfigDataInput(
            c_compiler = 'gcc',
            cxx_compiler = 'g++',
            expected_txt_array = [
                'C compiler identification is GNU',
                'CXX compiler identification is GNU'
            ]
        )

        TestConfig.config_data_input_clang = TestConfig.ConfigDataInput(
            c_compiler = 'clang',
            cxx_compiler = 'clang++',
            expected_txt_array = [
                'C compiler identification is Clang',
                'CXX compiler identification is Clang'
            ]
        )

        TestConfig.config_data_input_msvc = TestConfig.ConfigDataInput(
            c_compiler = 'cl',
            cxx_compiler = 'cl',
            expected_txt_array = [
                'C compiler identification is MSVC',
                'CXX compiler identification is MSVC'
            ]
        )
        TestConfig.config_data_input_cxx_std = ['98', '11', '14', '17', '20']
        
    @staticmethod
    def __createSingleTestDataLinux(cxx_standard):
        
        clang_gcc_generators = ['Unix Makefiles', 'Ninja', 'Eclipse CDT4 - Ninja', 'Eclipse CDT4 - Unix Makefiles']
        clang_gcc_compilers = [TestConfig.config_data_input_gcc, TestConfig.config_data_input_clang]
        profiles = ['Debug'] #, 'Release']
        
        output = []
        for generator in clang_gcc_generators:
            for compiler in clang_gcc_compilers:
                for profile in profiles:
                    if cxx_standard:
                        for cxx_std in TestConfig.config_data_input_cxx_std:
                            test_data = TestConfig.TestConfigData(generator, 
                                                compiler.c_compiler, 
                                                compiler.cxx_compiler,
                                                profile,
                                                cxx_std,
                                                compiler.expected_txt_array
                                                )
                            output.append([test_data])
                    else:
                        test_data = TestConfig.TestConfigData(generator, 
                                            compiler.c_compiler, 
                                            compiler.cxx_compiler,
                                            profile,
                                            None,
                                            compiler.expected_txt_array
                                            )
                        output.append([test_data])
        return output

    @staticmethod
    def __createSingleTestDataWindows(ninja_support, cxx_standard):
        # There is ninja issue with Conan:
        # clang++: error: argument unused during compilation: '-stdlib=libc++'
        clang_gcc_generators = ['MinGW Makefiles', 'Eclipse CDT4 - MinGW Makefiles']
        if ninja_support:
            clang_gcc_generators.extend(['Ninja', 'Eclipse CDT4 - Ninja'])

        clang_gcc_compilers = [TestConfig.config_data_input_gcc] # TestConfig.config_data_input_clang, 
        profiles = ['Debug'] #, 'Release']
        
        output_config = []
        for generator in clang_gcc_generators:
            for compiler in clang_gcc_compilers:
                for profile in profiles:
                    if cxx_standard:
                        
                        for cxx_std in TestConfig.config_data_input_cxx_std:
                            # CMake or Clang bug on Windows - flag std works only for 14, 17 and 20
                            if compiler.cxx_compiler == 'clang++' and cxx_std != '98' and cxx_std != '11':
                                test_data = TestConfig.TestConfigData(generator, 
                                                    compiler.c_compiler, 
                                                    compiler.cxx_compiler,
                                                    profile,
                                                    cxx_std,
                                                    compiler.expected_txt_array
                                                    )
                                output_config.append([test_data])
                    else:
                        test_data = TestConfig.TestConfigData(generator, 
                                            compiler.c_compiler, 
                                            compiler.cxx_compiler,
                                            profile,
                                            None,
                                            compiler.expected_txt_array
                                            )
                        output_config.append([test_data])
                        
        msvc_generator = 'Visual Studio 16 2019'
        for profile in profiles:
            if cxx_standard:
                for cxx_std in TestConfig.config_data_input_cxx_std:
                    if cxx_std != '98' and cxx_std != '11': # MS VC doesn't allow 98 nor 11
                        test_data = TestConfig.TestConfigData(msvc_generator, 
                                            TestConfig.config_data_input_msvc.c_compiler, 
                                            TestConfig.config_data_input_msvc.cxx_compiler,
                                            profile,
                                            cxx_std,
                                            TestConfig.config_data_input_msvc.expected_txt_array
                                            )
                        output_config.append([test_data])
            else:
                test_data = TestConfig.TestConfigData(msvc_generator, 
                                    TestConfig.config_data_input_msvc.c_compiler, 
                                    TestConfig.config_data_input_msvc.cxx_compiler,
                                    profile,
                                    None,
                                    TestConfig.config_data_input_msvc.expected_txt_array
                                    )
                output_config.append([test_data])
                                
        return output_config
    
    @staticmethod
    def __createSingleTestDataMacOS(ninja_support, cxx_standard):
        clang_gcc_generators = ['Unix Makefiles','Xcode']
        if ninja_support:
            clang_gcc_generators.extend(['Ninja', 'Eclipse CDT4 - Ninja'])

        clang_gcc_compilers = [TestConfig.config_data_input_clang, TestConfig.config_data_input_gcc] 
        profiles = ['Debug'] #, 'Release']
        
        output_config = []
        for generator in clang_gcc_generators:
            for compiler in clang_gcc_compilers:
                for profile in profiles:
                    if cxx_standard:
                        
                        for cxx_std in TestConfig.config_data_input_cxx_std:
                            test_data = TestConfig.TestConfigData(generator, 
                                                compiler.c_compiler, 
                                                compiler.cxx_compiler,
                                                profile,
                                                cxx_std,
                                                compiler.expected_txt_array
                                                )
                            output_config.append([test_data])
                    else:
                        test_data = TestConfig.TestConfigData(generator, 
                                            compiler.c_compiler, 
                                            compiler.cxx_compiler,
                                            profile,
                                            None,
                                            compiler.expected_txt_array
                                            )
                        output_config.append([test_data])
                        
        return output_config

    @staticmethod
    def createSingleTestData(cxx_standard = False, ninja_support = True):
        TestConfig.__createConfigData()
        if SysOp().linux:
            return TestConfig.__createSingleTestDataLinux(cxx_standard)
        if SysOp().windows:
            return TestConfig.__createSingleTestDataWindows(ninja_support, cxx_standard)
        if SysOp().macos:
            return TestConfig.__createSingleTestDataMacOS(ninja_support, cxx_standard)