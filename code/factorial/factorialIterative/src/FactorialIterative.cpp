#include "FactorialIterative.hpp"
#include <fstream>
#include <filesystem>

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