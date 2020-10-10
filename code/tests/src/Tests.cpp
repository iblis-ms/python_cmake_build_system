#include <gtest/gtest.h>
#include <Lib.hpp>

using namespace testing;


TEST(TestSuite, TestCase)
{
	CLib lib;
	const uint32_t input = 1; 
	const auto ptr = lib.create(input);
	ASSERT_EQ(*ptr, input);
}