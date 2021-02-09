#include "Factorial.hpp"

unsigned int factorialRecursive(unsigned int aIndex)
{
    if (aIndex <= 1)
    {
        return 1;
    }
    return aIndex * factorialRecursive(aIndex - 1);
}

unsigned int factorialIterative(unsigned int aIndex)
{
    unsigned int result = 1;
    for (unsigned int i = 1; i <= aIndex; ++i)
    {
        result *= i;
    }
    return result;
}
