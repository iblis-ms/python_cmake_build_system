#ifndef INTEFACE_TARGET_2_HPP_
#define INTEFACE_TARGET_2_HPP_

#include <iostream>
#include <InterfaceTarget1/InterfaceTarget1.hpp>

struct IInterfaceTarget2 : IInterfaceTarget1
{
	IInterfaceTarget2()
	{
		std::cout<<"IInterfaceTarget2\n";
	}

	virtual ~IInterfaceTarget2() = default;

	virtual void fun_interface2() = 0;
};

#endif // INTEFACE_TARGET_2_HPP_
