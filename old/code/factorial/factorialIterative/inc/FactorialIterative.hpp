#ifndef FACTORIAL_ITERATIVE_HPP_
#define FACTORIAL_ITERATIVE_HPP_

#include <FactorialInterface.hpp>

class CFactorialIterative : public IFactorialInterface
{
public:
    virtual ~CFactorialIterative() = default;

    virtual unsigned int calc(unsigned int aIndex);
    
    virtual unsigned int calcFromFile(const std::filesystem::path& aPath);
};

#endif // FACTORIAL_ITERATIVE_HPP_
