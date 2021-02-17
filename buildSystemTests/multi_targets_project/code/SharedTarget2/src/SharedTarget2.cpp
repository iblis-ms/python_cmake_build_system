#include "SharedTarget2/SharedTarget2.hpp"
#include "SharedTarget2/SharedTarget2Private.hpp"

void CSharedTarget2::fun_interface3()
{
	std::cout<<"fun_interface3 from CStaticTarget1\n";
}

IInterfaceTarget2& CSharedTarget2::getInterfaceTarget2()
{
	static CSharedTarget2Private obj;
	return obj;
}