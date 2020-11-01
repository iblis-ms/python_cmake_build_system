#ifndef FACTORIAL_INTERFACE_HPP_
#define FACTORIAL_INTERFACE_HPP_

#include <filesystem>

class IFactorialInterface
{
public:
    virtual ~IFactorialInterface() = default;

    virtual unsigned int calc(unsigned int aIndex) = 0;
    
    virtual unsigned int calcFromFile(const std::filesystem::path& aPath) = 0;
};

#endif // FACTORIAL_INTERFACE_HPP_
