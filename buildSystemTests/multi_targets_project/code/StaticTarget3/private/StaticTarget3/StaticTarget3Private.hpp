#ifndef STATIC_TARGET_3_PRIVATE_HPP_
#define STATIC_TARGET_3_PRIVATE_HPP_

#include <iostream>
#include <InterfaceTarget2/InterfaceTarget2.hpp>

struct CStaticTarget3Private : IInterfaceTarget2
{
	virtual void fun_interface2() override
	{
		std::cout<<"fun_interface2 from CStaticTarget3Private\n";
	}


	virtual void fun_interface1() override
	{
		std::cout<<"fun_interface1 from CStaticTarget3Private\n";
	}
};

#endif // STATIC_TARGET_3_PRIVATE_HPP_
