#ifndef INTEFACE_TARGET_1_HPP_
#define INTEFACE_TARGET_1_HPP_

#include <iostream>

struct IInterfaceTarget1
{
	IInterfaceTarget1()
	{
		std::cout<<"IInterfaceTarget1\n";
	}
	
	virtual ~IInterfaceTarget1() = default;

	virtual void fun_interface1() = 0;
};

#endif // INTEFACE_TARGET_1_HPP_
