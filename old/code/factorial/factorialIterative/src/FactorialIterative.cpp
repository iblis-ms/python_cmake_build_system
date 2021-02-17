#include "FactorialIterative.hpp"
#include <fstream>
#include <filesystem>
#include <stdexcept>
#include <iostream>

unsigned int CFactorialIterative::calc(unsigned int aIndex)
{
    unsigned int result = 1;
    for (unsigned int i = 1; i <= aIndex; ++i)
    {
        result *= i;
    }
    return result;
}
    
unsigned int CFactorialIterative::calcFromFile(const std::filesystem::path& aPath)
{
    if (std::filesystem::is_directory(aPath))
    {
        const std::filesystem::path filePath = aPath / "iterative.txt";
        std::ifstream file;
        file.open(filePath.c_str());
        if (!file)
        {
            throw std::invalid_argument("incorrect path");
        }
        unsigned int index = 0;
        file>>index;
        return calc(index);
    }
    else
    {
        std::ifstream file;
        file.open(aPath.c_str());
        if (!file)
        {
            throw std::invalid_argument("incorrect path");
        }
        unsigned int index = 0;
        file>>index;
        return calc(index);
    }
}
