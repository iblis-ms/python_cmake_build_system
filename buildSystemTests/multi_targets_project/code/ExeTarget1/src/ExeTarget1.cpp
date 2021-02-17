#include "ExeTarget1/ExeTarget1Private.hpp"

#include <SharedTarget1/SharedTarget1.hpp>
#include <SharedTarget2/SharedTarget2.hpp>

void CExeTarget1Private::fun()
{
	std::cout<<"CExeTarget1Private\n";
}


int main()
{
	CExeTarget1Private exeTarget1;
	exeTarget1.fun();

	CSharedTarget1 shared1;
	shared1.fun_interface3();

	IInterfaceTarget2& shared1Target2 = shared1.getInterfaceTarget2();
	shared1Target2.fun_interface1();
	shared1Target2.fun_interface2();


	CSharedTarget2 shared2;
	shared2.fun_interface3();

	IInterfaceTarget2& shared2Target2 = shared2.getInterfaceTarget2();
	shared2Target2.fun_interface1();
	shared2Target2.fun_interface2();

	return 0;
}