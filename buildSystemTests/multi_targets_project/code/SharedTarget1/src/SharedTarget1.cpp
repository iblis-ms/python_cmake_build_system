#include "SharedTarget1/SharedTarget1.hpp"
#include "SharedTarget1/SharedTarget1Private.hpp"

void CSharedTarget1::fun_interface3()
{
	std::cout<<"fun_interface3 from CSharedTarget1\n";
}

IInterfaceTarget2& CSharedTarget1::getInterfaceTarget2()
{
	static CSharedTarget1Private obj;
	return obj;
}