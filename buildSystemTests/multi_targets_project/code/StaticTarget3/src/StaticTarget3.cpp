#include "StaticTarget3/StaticTarget3.hpp"
#include "StaticTarget3/StaticTarget3Private.hpp"

void CStaticTarget3::fun_interface3()
{
	std::cout<<"fun_interface3 from CStaticTarget3\n";
}

void CStaticTarget3::fun_interface4()
{
	std::cout<<"fun_interface4 from CStaticTarget3\n";
}

IInterfaceTarget2& CStaticTarget3::getInterfaceTarget2()
{
	static CStaticTarget3Private obj;
	return obj;
}

CStaticTarget1& CStaticTarget3::getStaticTarget1()
{
	static CStaticTarget1 obj;
	return obj;
}

CStaticTarget2& CStaticTarget3::getStaticTarget2()
{
	static CStaticTarget2 obj;
	return obj;
}