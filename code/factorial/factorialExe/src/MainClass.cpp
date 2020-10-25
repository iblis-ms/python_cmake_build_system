#include "MainClass.hpp"
#include <FactorialFactoryRecursive.hpp>
#include <FactorialFactoryIterative.hpp>
#include <iostream>

void CMainClass::run()
{
	{
		CFactorialFactoryRecursive recursive;
		auto recursiveImpl = recursive.create();
		std::cout<<"Recursive: "<<recursiveImpl->calc(4)<<std::endl;
	}
	{
		CFactorialFactoryIterative iterative;
		auto iterativeImpl = iterative.create();
		std::cout<<"Iterative: "<<iterativeImpl->calc(4)<<std::endl;

	}
}