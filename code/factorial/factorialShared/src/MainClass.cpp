#include "MainClass.hpp"
#include <FactorialFactoryRecursive.hpp>
#include <FactorialFactoryIterative.hpp>
#include <iostream>


CMainClass::CMainClass()
{
    std::cout<<"I am a static version\n";
}

unsigned int CMainClass::runFibonacci(EMethod aMethod, unsigned int aIndex)
{
    if (EMethod::EITERATIVE == aMethod)
    {
        CFactorialFactoryIterative iterative;
        auto iterativeImpl = iterative.create();
        return iterativeImpl->calc(aIndex);
    }
    else if (EMethod::ERECURSIVE == aMethod)
    {
        CFactorialFactoryRecursive recursive;
        auto recursiveImpl = recursive.create();
        return recursiveImpl->calc(aIndex);
    }
    else
    {
        return 0;
    }
}

unsigned int CMainClass::runFibonacciFromFile(EMethod aMethod, const std::filesystem::path& aPath)
{
    if (EMethod::EITERATIVE == aMethod)
    {
        CFactorialFactoryIterative iterative;
        auto iterativeImpl = iterative.create();
        return iterativeImpl->calcFromFile(aPath);
    }
    else if (EMethod::ERECURSIVE == aMethod)
    {
        CFactorialFactoryRecursive recursive;
        auto recursiveImpl = recursive.create();
        return recursiveImpl->calcFromFile(aPath);
    }
    else
    {
        return 0;
    }
}

