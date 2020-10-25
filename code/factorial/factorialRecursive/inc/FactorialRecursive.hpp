#ifndef FACTORIAL_RECURSIVE_HPP_
#define FACTORIAL_RECURSIVE_HPP_

#include <FactorialInterface.hpp>

class CFactorialRecursive : public IFactorialInterface
{
public:
	virtual ~CFactorialRecursive() = default;

	virtual unsigned int calc(unsigned int aIndex);
	
	virtual unsigned int calcFromFile(const std::filesystem::path& aPath);
};

#endif // FACTORIAL_RECURSIVE_HPP_