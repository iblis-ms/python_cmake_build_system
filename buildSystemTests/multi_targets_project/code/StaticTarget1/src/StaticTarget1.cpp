#include "StaticTarget1/StaticTarget1.hpp"
#include "StaticTarget1/StaticTarget1Private.hpp"

void CStaticTarget1::fun_interface3()
{
	std::cout<<"fun_interface3 from CStaticTarget1\n";
}

IInterfaceTarget2& CStaticTarget1::getInterfaceTarget2()
{
	static CStaticTarget1Private obj;
	return obj;
}