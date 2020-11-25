#ifndef MAIN_CLASS_HPP_
#define MAIN_CLASS_HPP_

#include <filesystem>

class CMainClass
{
public:

    enum class EMethod
    {
        EITERATIVE, ERECURSIVE
    };
    
    CMainClass();
    
    unsigned int runFactorial(EMethod aMethod, unsigned int aIndex);

    unsigned int runFactorialFromFile(EMethod aMethod, const std::filesystem::path& aPath);
};

#endif // MAIN_CLASS_HPP_

