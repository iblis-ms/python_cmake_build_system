#include <gtest/gtest.h>
#include <filesystem>

#include "FactorialRecursive.hpp"

using namespace ::testing;


enum 
{
    EINPUT_INDEX = 0,
    EEXPECTED_INDEX = 1
};


class CRecursiveTest : public TestWithParam<tuple<unsigned int, unsigned int>>
{
public:

    static unsigned int getInput(const tuple<unsigned int, unsigned int>& aParam)
    {
        return get<EINPUT_INDEX>(aParam);
    }

    static unsigned int getExpected(const tuple<unsigned int, unsigned int>& aParam)
    {
        return get<EEXPECTED_INDEX>(aParam);
    }
    
    unsigned int getInput() const
    {
        return getInput(GetParam());
    }
    
    unsigned int getExpected() const
    {
        return getExpected(GetParam());
    }

    
};


TEST_P(CRecursiveTest, calc)
{
    const auto input = getInput();
    const auto expected = getExpected();
    
    CFactorialRecursive factorial;
    
    ASSERT_EQ(factorial.calc(input), expected)<<"input: "<<input<<" expected: "<<expected;

}

TEST_P(CRecursiveTest, calcFromFile)
{
    using namespace std::string_literals;
    const auto input = getInput();
    const auto expected = getExpected();
    
    CFactorialRecursive factorial;
    
    const std::string fileName = "recursive_"s + std::to_string(input) + ".txt";
    std::filesystem::path path(fileName);
    ASSERT_EQ(factorial.calcFromFile(path), expected)<<"file: "<<fileName<<" expected: "<<expected;

}

std::string printTestCase(const testing::TestParamInfo<CRecursiveTest::ParamType>& aInfo)
{
    using namespace std::string_literals;
    return "INPUT_"s + std::to_string(CRecursiveTest::getInput(aInfo.param));
}


INSTANTIATE_TEST_SUITE_P(Factorial_,// name of a test instance
    CRecursiveTest,// name of a test suite
    Values(
        make_tuple(1, 1),
        make_tuple(2, 2),
        make_tuple(3, 6),
        make_tuple(4, 24),
        make_tuple(5, 120),
        make_tuple(6, 720)
        ),
        printTestCase);// test parameters


TEST(RecursiveTest, calcFromDir)
{
	std::cout<<"calcFromDir calcFromDircalcFromDircalcFromDir MEMORY LEAK\n";
    CFactorialRecursive factorial;
    
    const std::filesystem::path path("recursive_dir");
    
    ASSERT_EQ(factorial.calcFromFile(path), 720u);

#ifdef SANITIZER_ENABLE 
	std::cout<<"SANITIZER_ENABLE enabled\n";
    int* ptrMemoryLeakRecursive = new int; // memory leak
    int uninitializedRecursive;
    if (uninitializedRecursive)
    {
		return;
	}
#endif 
}

