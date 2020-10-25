#include <gtest/gtest.h>

#include "FactorialRecursive.hpp"

TEST(RecursiveTest, calc)
{
	CFactorialRecursive factorial;
	ASSERT_EQ(factorial.calc(0), 1);
	ASSERT_EQ(factorial.calc(1), 1);
	ASSERT_EQ(factorial.calc(2), 2);
	ASSERT_EQ(factorial.calc(3), 6);
	ASSERT_EQ(factorial.calc(4), 24);
}
