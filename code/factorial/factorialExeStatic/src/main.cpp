#include "MainClass.hpp"
#include <iostream>
#include <filesystem>

namespace
{
const char* const gMethodStr[] = {"Iterative", "Recursive"};


void run(CMainClass::EMethod aMethod, const std::filesystem::path& aPath)
{
    CMainClass m;
    std::cout<<gMethodStr[static_cast<unsigned int>(aMethod)]<<":\n";
    for (unsigned int i = 0; i < 10; ++i)
    {
        std::cout<<i<<": "<<m.runFibonacci(aMethod, i)<<std::endl;
    }
    
    if (std::filesystem::is_character_file(aPath))
    {
        std::cout<<"File: "<<aPath<<":\n";
        std::cout<<"Value: "<<m.runFibonacciFromFile(aMethod, aPath)<<std::endl;
    }
}

} // anonymous namespace

int main(int aArgc, char** aArgv)
{
    const std::filesystem::path path;
    run(CMainClass::EMethod::EITERATIVE, path);
    run(CMainClass::EMethod::ERECURSIVE, path);
    
    return 0;
}
