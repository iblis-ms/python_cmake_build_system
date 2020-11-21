#include <gtest/gtest.h>
#include <filesystem>

#include "FactorialIterative.hpp"

using namespace ::testing;


enum 
{
    EINPUT_INDEX = 0,
    EEXPECTED_INDEX = 1
};


class CIterativeTest : public TestWithParam<tuple<unsigned int, unsigned int>>
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


TEST_P(CIterativeTest, calc)
{
    const auto input = getInput();
    const auto expected = getExpected();
    
    CFactorialIterative factorial;
    
    ASSERT_EQ(factorial.calc(input), expected)<<"input: "<<input<<" expected: "<<expected;

}

TEST_P(CIterativeTest, calcFromFile)
{
    using namespace std::string_literals;
    const auto input = getInput();
    const auto expected = getExpected();
    
    CFactorialIterative factorial;
    
    const std::string fileName = "iterative_"s + std::to_string(input) + ".txt";
    
    std::filesystem::path path(fileName);
    ASSERT_EQ(factorial.calcFromFile(path), expected)<<"file: "<<fileName<<" expected: "<<expected;

}

std::string printTestCase(const testing::TestParamInfo<CIterativeTest::ParamType>& aInfo)
{
    using namespace std::string_literals;
    return "INPUT_"s + std::to_string(CIterativeTest::getInput(aInfo.param));
}


INSTANTIATE_TEST_SUITE_P(Factorial_,// name of a test instance
    CIterativeTest,// name of a test suite
    Values(
        make_tuple(1, 1),
        make_tuple(2, 2),
        make_tuple(3, 6),
        make_tuple(4, 24),
        make_tuple(5, 120),
        make_tuple(6, 720)
        ),
        printTestCase);// test parameters



TEST(IterativeTest, calcFromDir)
{
    CFactorialIterative factorial;
    const std::filesystem::path path("iterative_dir");
    ASSERT_EQ(factorial.calcFromFile(path), 720u);
    
#ifdef TEST_MOMORY_LEAKS 
    int* ptrMemoryLeakIterative = new int; // memory leak
    int uninitializedIterative;
    if (uninitializedIterative)
    {
		return;
	}
#endif 
}

