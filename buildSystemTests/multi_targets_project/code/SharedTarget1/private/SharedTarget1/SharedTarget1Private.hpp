#ifndef SHARED_TARGET_1_PRIVATE_HPP_
#define SHARED_TARGET_1_PRIVATE_HPP_

#include <iostream>
#include <InterfaceTarget2/InterfaceTarget2.hpp>

struct CSharedTarget1Private : IInterfaceTarget2
{
	virtual void fun_interface2() override
	{
		std::cout<<"fun_interface2 from CSharedTarget1Private\n";
	}


	virtual void fun_interface1() override
	{
		std::cout<<"fun_interface1 from CSharedTarget1Private\n";
	}
};

#endif // SHARED_TARGET_1_PRIVATE_HPP_
