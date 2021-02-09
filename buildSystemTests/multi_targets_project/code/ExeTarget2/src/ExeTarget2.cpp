#include "ExeTarget2/ExeTarget2Private.hpp"

#include <StaticTarget1/StaticTarget1.hpp>
#include <StaticTarget2/StaticTarget2.hpp>
#include <StaticTarget3/StaticTarget3.hpp>

void CExeTarget2Private::fun()
{
	std::cout<<"CExeTarget2Private\n";
}


int main()
{
	CExeTarget2Private exeTarget2;
	exeTarget2.fun();

	CStaticTarget1 static1;
	CStaticTarget2 static2;
	CStaticTarget3 static3;

	return 0;
}