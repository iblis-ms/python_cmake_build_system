#include "FactorialRecursive.hpp"
#include <fstream>
#include <filesystem>

unsigned int CFactorialRecursive::calc(unsigned int aIndex)
{
    if (aIndex <= 1)
    {
        return 1;
    }
    return aIndex * calc(aIndex - 1);
}
	
unsigned int CFactorialRecursive::calcFromFile(const std::filesystem::path& aPath)
{
	if (std::filesystem::is_directory(aPath))
	{
		const std::filesystem::path filePath = aPath / "recursive.txt";
		std::ifstream file(filePath);
		unsigned int index = 0;
		file>>index;
		return calc(index);
	}
	else
	{
		std::ifstream file(aPath);
		unsigned int index = 0;
		file>>index;
		return calc(index);
	}
}
