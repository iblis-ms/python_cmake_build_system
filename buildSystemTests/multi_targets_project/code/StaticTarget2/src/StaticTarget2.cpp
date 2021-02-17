#include "StaticTarget2/StaticTarget2.hpp"
#include "StaticTarget2/StaticTarget2Private.hpp"

void CStaticTarget2::fun_interface4()
{
	std::cout<<"fun_interface4 from CStaticTarget2\n";
}

IInterfaceTarget2& CStaticTarget2::getInterfaceTarget2()
{
	static CStaticTarget2Private obj;
	return obj;
}