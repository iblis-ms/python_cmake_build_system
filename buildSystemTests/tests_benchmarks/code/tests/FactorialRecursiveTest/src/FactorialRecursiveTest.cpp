#include <gtest/gtest.h>
#include "Factorial.hpp"


TEST(Factorial, Recursive0)
{
    const unsigned int index = 0;
    const unsigned int expected = 1;
    const unsigned int actual = factorialRecursive(index);
    ASSERT_EQ(expected, actual);
}

TEST(Factorial, Recursive3)
{
    const unsigned int index = 3;
    const unsigned int expected = 6;
    const unsigned int actual = factorialRecursive(index);
    ASSERT_EQ(expected, actual);
}